
# Note tomcat customise
```
java -Xmx2048m -Xms2048m -XX:PermSize=512m -XX:MaxPermSize=1024m -XX:+UseParallelGC -XX:ParallelGCThreads=4 

VM SWITCH					VM SWITCH DESCRIPTION
-Xms					Dung lượng  Heap khởi tạo (initial) khi  JVM starts
-Xmx					Dung lượng max Heap
-Xmn					Dung luọng Young Generation, Nhiệm vụ giải phóng Mem và chuyển sang for Old Generation.
-XX:PermGen				Dung lượng initial  của Permanent Generation
-XX:MaxPermGen			Dung lượng Max của Perm Gen
-XX:SurvivorRatio		For providing ratio of Eden space and Survivor Space, for example if Young Generation size is 10m and VM switch is -XX:SurvivorRatio=2 		then 5m will be reserved for Eden Space and 2.5m each for both the Survivor spaces. The default value is 8.
-XX:NewRatio			For providing ratio of old/new generation sizes. The default value is 2.


*) Các loại Garbage Collector (GC)
Có 3 loại GC:

1. Serial GC – Chỉ sử dụng 1 thread thực hiện. Chủ yếu ứng dụng cho các app/services với data nhỏ. Khai báo sử dụng với tuỳ chọn: -XX:+UseSerialGC

2. Parallel GC – Sử dụng multithread để thực hiện quá trình GC. Loại GC này còn được gọi là Throughput collector. Khai báo sử dụng với tuỳ chọn: -XX:+UseParallelGC, và số thread được khai báo với tham số: -XX:ParallelGCThreads=n (với n là số threads được sử dụng)

3. Mostly concurrent GC – Như đã biết khi GC thực hiện, thì tất cả các thread sẽ bị dừng lại. Tuy nhiên sử dụng loại GC này thì nó sẽ hầu như chạy đồng thời với application. Tại sao nói là "hầu như" đồng thời, bởi vì nó không hoạt động đồng thời 100% với các application, có những khoảng thời gian mà tất cả các thread cũng bị dừng lại. Tuy nhiên, khoảng thời gian đó luôn ngắng nhất để đảm bảo hiệu năng của GC. Với loại này ta lại chia thành 2 loại GC:

3.1 Garbage First – high throughput with a reasonable application pause time. Được sử dụng với khai báo: -XX:+UseG1GC

3.2 Concurrent Mark Sweep – The application pause time is kept to a minimum. Được sử dụng với khai báo: -XX:+UseConcMarkSweepGC. Từ bản JDK 9 trở đi, loại GC này ko được dùng nữa.

*) Tips and Tricks
To minimize the memory footprint, limit the scope of the variables as much as possible. Remember that each time the top scope from the stack is popped up, the references from that scope are lost, and this could make objects eligible for garbage collecting.

Explicitly refer to null obsolete references. That will make objects those refer to eligible for garbage collecting.

Avoid finalizers. They slow down the process and they do not guarantee anything. Prefer phantom references for cleanup work.

Do not use strong references where weak or soft references apply. The most common memory pitfalls are caching scenarios,when data is held in memory even if it might not be needed.

JVisualVM also has the functionality to make a heap dump at a certain point, so you could analyze, per class, how much memory it occupies.

Configure your JVM based on your application requirements. Explicitly specify the heap size for the JVM when running the application. The memory allocation process is also expensive, so allocate a reasonable initial and maximum amount of memory for the heap. If you know it will not make sense to start with a small initial heap size from the beginning, the JVM will extend this memory space. Specifying the memory options with the following options:

Initial heap size -Xms512m – set the initial heap size to 512 megabytes.

Maximum heap size -Xmx1024m – set the maximum heap size to 1024 megabytes.

Thread stack size -Xss128m – set the thread stack size to 128 megabytes.

Young generation size -Xmn256m – set the young generation size to 256 megabytes.

If a Java application crashes with an OutOfMemoryError and you need some extra info to detect the leak, run the process with the –XX:HeapDumpOnOutOfMemory parameter, which will create a heap dump file when this error happens next time.

-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/tmp/heapdump.bin

Use the -verbose:gc option to get the garbage collection output. Each time a garbage collection takes place, an output will be generated.

*) Heap Dump

/opt/WEB/jdk1.6/bin/jmap -dump:format=b,file=/home/hocnv/heapdump.bin 28596


export JAVA_HOME=/opt/jdk1.8.0_201/
export PATH=$JAVA_HOME/bin:$PATH
export CATALINA_HOME=/opt/WEB/tomcat8-6080-Portal
export JAVA_OPTS="-Xmx512m -Xms512m -XX:PermSize=512m -XX:MaxPermSize=512m -XX:+UseParallelGC -XX:ParallelGCThreads=3"
```



