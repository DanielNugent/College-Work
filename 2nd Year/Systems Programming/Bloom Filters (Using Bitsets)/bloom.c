#include <stdlib.h>
#include "bloom.h"

const int BLOOM_HASH1 = 17;
const int BLOOM_HASH2 = 29;

// compute a hash of a string using a seed value, where the result
// falls between zero and range-1
int hash_string(char * string, int seed, int range)
{
  int i;
  int hash = 0;

  // simple loop for mixing the input string
  for ( i = 0; string[i] != '\0'; i++ ) {
    hash = hash * seed + string[i];
  }
  // check for unlikely case that hash is negative
  if ( hash < 0 ) {
    hash = -hash;
  }
  // bring the hash within the range 0..range-1
  hash = hash % range;
  
  return hash;
}

// create a new, empty Bloom filter with 'size' slots
struct bloom *bloom_new(int size){
	bloom *newBloom = (bloom *)malloc(sizeof(bloom));
	newBloom->bit_vector = bitset_new(size);
	newBloom->size = size;
	return newBloom;
}

// check to see if a string is in the set
int bloom_lookup(struct bloom * this, char * item){
	int hash1 = hash_string(item, BLOOM_HASH1, this->size);
	int hash2 = hash_string(item, BLOOM_HASH2, this->size);
  bool hasFirst = (this->bit_vector->data[hash1 / this->bit_vector->bits_in_word] & (1 << (hash1 % this->bit_vector->bits_in_word))) != 0;
  bool hasSecond = (this->bit_vector->data[hash2 / this->bit_vector->bits_in_word] & (1 << (hash2 % this->bit_vector->bits_in_word))) != 0;

	return (hasFirst && hasSecond);

}

// add a string to the set has no effect if the item is already in the
// set
void bloom_add(struct bloom * this, char * item){
	int hash1 = hash_string(item, BLOOM_HASH1, this->size);
	int hash2 = hash_string(item, BLOOM_HASH2, this->size);
  this->bit_vector->data[hash1 / this->bit_vector->bits_in_word] |= (1 << (hash1 % this->bit_vector->bits_in_word));
	this->bit_vector->data[hash2 / this->bit_vector->bits_in_word] |= (1 << (hash2 % this->bit_vector->bits_in_word));
}

//note that you cannot safely remove items from a Bloom filter

// place the union of src1 and src2 into dest
void bloom_union(struct bloom * dest, struct bloom * src1, struct bloom * src2){
	for(int i = dest->size / dest->bit_vector->bits_in_word; i-- > 0;){
		dest->bit_vector->data[i] = src1->bit_vector->data[i] | src2->bit_vector->data[i];
	}
}

// place the intersection of src1 and src2 into dest
void bloom_intersect(struct bloom * dest, struct bloom * src1, struct bloom * src2){
	for(int i = dest->size / dest->bit_vector->bits_in_word; i-- > 0;){
		dest->bit_vector->data[i] = src1->bit_vector->data[i] & src2->bit_vector->data[i];
	}
}

// print out the bits that are 1 in the bit vector of
// a bloom filter
void bloom_print(struct bloom * this)
{
  bitset_print(this->bit_vector);
}
