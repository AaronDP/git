cp build.log build.log.bak
./android-build.sh 2>&1 | tee build.log 
ls -l build.log* >> build.log
vim build.log
