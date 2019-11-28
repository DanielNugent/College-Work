#include <stdio.h>
#include <stdlib.h>
#include <bits/stdc++.h>
using namespace std;

const int addrs[] = {
    /* => */  /* => */  /* => */  /* => */  /* => */  /* => */
    0x0000, 0x0004, 0x000c, 0x2200, 0x00d0, 0x00e0, 0x1130, 0x0028, 
    0x113c, 0x2204, 0x0010, 0x0020, 0x0004, 0x0040, 0x2208, 0x0008,
    0x00a0, 0x0004, 0x1104, 0x0028, 0x000c, 0x0084, 0x000c, 0x3390, 
    0x00b0, 0x1100, 0x0028, 0x0064, 0x0070, 0x00d0, 0x0008, 0x3394
}; 
 
int hits = 0;
int misses = 0;

class Cache {
    int L = 16;
    int K;
    int N;

    list<int> tag[8]; 
    unordered_map<int, unordered_map<int, list<int>::iterator>> cacheMap; 

    public:
        Cache(int, int);
        bool find(int, int);
        int getK();
        int getN();
    };

    Cache::Cache(int n, int k){
        K = k;
        N = n;
    }

    int Cache:: getK(){
        return K;
    }

    int Cache:: getN(){
        return N;
    }

    bool Cache:: find(int x, int y){
        bool found;
        if(cacheMap[y].find(x) == cacheMap[y].end()) { 
            if(tag[y].size() == K) { 
                int last = tag[y].back(); 
                tag[y].pop_back(); 
                cacheMap[y].erase(last); 
            } 
            found = false;
        } 
    
        else {
            tag[y].erase(cacheMap[y][x]); 
            found = true;
        }

        tag[y].push_front(x); 
        cacheMap[y][x] = tag[y].begin(); 

        return found;
    }


    int findSetNumber(int address, int set){
        int setN = (address % 256) / 16;
        if (setN >= set) {
            return setN % set;
        }
        else {
            return setN; 
        }
    }

int main(){
    Cache cache(1, 8); // cache (n, k)
    int init;
    int N = cache.getN();
    int size = *(&addrs + 1) - addrs; 
    std::cout << "Cache Simulation with L= 16, N= " << cache.getN() << ", K= " << cache.getK() << "\nResult: \n";
    for(int i = 0; i<size; i++){
        init = findSetNumber(addrs[i],N);
        std::cout << "0x" << std::hex << addrs[i];
        if(cache.find(addrs[i] / 16, init)){
            hits++;
            std::cout << " hit\n";
        }
        else{
            misses++;
            std::cout << " miss\n";
        }
    }	
    std::cout <<"Hits: " << std::dec << hits << "\nMisses: " << misses << "\n";
}