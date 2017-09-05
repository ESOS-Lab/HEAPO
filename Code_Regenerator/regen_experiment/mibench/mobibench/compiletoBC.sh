

# compiling source to llvm bitcode file

rm app* *.o

clang -o mobibench.o mobibench.c -c -flto -g
clang -o sqlite3.o sqlite3.c -c -flto -g
llvm-link mobibench.o sqlite3.o -o app-g.bc

#./profiletool -a l -i app-g.bc -o apppf-g.bc
./profiletool -a h -i app-g.bc -o apppf-g.bc
opt --strip-debug apppf-g.bc -o apppf.bc

llc -filetype=obj apppf.bc -o app.o
clang++ app.o -o app.bin -lpthread -ldl -DNDEBUG=1 -DHAVE_USLEEP=1 -DSQLITE_HAVE_ISNAN -DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576 -DSQLITE_THREADSAFE=2 -DSQLITE_TEMP_STORE=3 -DSQLITE_POWERSAFE_OVERWRITE=1 -DSQLITE_DEFAULT_FILE_FORMAT=4 -DSQLITE_DEFAULT_AUTOVACUUM=1 -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_BACKWARDS -DSQLITE_ENABLE_FTS4 -DSQLITE_OMIT_BUILTIN_TEST -DSQLITE_OMIT_COMPILEOPTION_DIAGS -DSQLITE_OMIT_LOAD_EXTENSION -DSQLITE_DEFAULT_FILE_PERMISSIONS=0666 -DUSE_PREAD64 --static


./app.bin -p ./ -d 0 -n 10000 -j 0 -s 0

