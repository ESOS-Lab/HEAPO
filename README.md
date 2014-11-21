HEAPO
-----
we developed a heap-based persistent object store, HEAPO, to manage persistent objects in byte-addressable NVRAM. HEAPO defines its own persistent heap layout, the persistent object format, name space organization, object sharing and protection mechanism, and undo-only log based crash recovery, all of which are effectively tailored for NVRAM. We put our effort into developing lightweight and flexible layer to exploit the DRAM-like access latency of NVRAM. To address this objective, we developed (i) native management layer for NVRAM to eliminate redundancy between in-core and on-disk copy of the metadata, (ii) expandable object format, (iii) burst trie based global name space with local name space caching, (iv) static address binding, and (v) minimal logging for undo-only crash recovery.

Publication
-----
* Taeho Hwang, Jaemin Jung, and Youjip Won, "HEAPO: Heap-based Persistent Object Store", ACM Transactions on Storage, Accepted for publication, May 2014 

Acknowledgement
-----
* This work is supported by IT R&D program MKE/KEIT (No. 10041608, Embedded System Software for New-memory based Smart Device), and supported by IT R&D program MKE/KEIT. [No.10035202, Large Scale hyper-MLC SSD Technology Development].
