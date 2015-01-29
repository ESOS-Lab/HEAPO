HEAPO
-----
we developed a heap-based persistent object store, HEAPO, to manage persistent objects in byte-addressable NVRAM. HEAPO defines its own persistent heap layout, the persistent object format, name space organization, object sharing and protection mechanism, and undo-only log based crash recovery, all of which are effectively tailored for NVRAM. We put our effort into developing lightweight and flexible layer to exploit the DRAM-like access latency of NVRAM. To address this objective, we developed (i) native management layer for NVRAM to eliminate redundancy between in-core and on-disk copy of the metadata, (ii) expandable object format, (iii) burst trie based global name space with local name space caching, (iv) static address binding, and (v) minimal logging for undo-only crash recovery.

Publication
-----
* Taeho Hwang, Jaemin Jung, and Youjip Won, "[HEAPO: Heap-based Persistent Object Store](http://delivery.acm.org/10.1145/2630000/2629619/a3-hwang.pdf?ip=166.104.46.128&id=2629619&acc=ACTIVE%20SERVICE&key=0EC22F8658578FE1%2E3DD5647BAD8CE12F%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35&CFID=595391126&CFTOKEN=80988479&__acm__=1422531290_a779e4b0feaab4060a9ce8ac4e1a9979)", ACM Transactions on Storage, Accepted for publication, May 2014 

Acknowledgement
-----
* This work is supported by IT R&D program MKE/KEIT (No. 10041608, Embedded System Software for New-memory based Smart Device), and supported by IT R&D program MKE/KEIT. [No.10035202, Large Scale hyper-MLC SSD Technology Development].
