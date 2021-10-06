import 'dart:io';

void main(){

  do_100_jobs_sync();

  do_100_jobs_async();

  do_100_jobs_sync();
}





void  do_100_jobs_async()  {
  for(int i = 0 ; i<100 ; i++){
     job_sync(i);
  }
}






void  do_100_jobs_sync() async {
  for(int i = 0 ; i<100 ; i++){
    await job_sync(i);
  }
}







Future<void> job_sync( int i) async {

  print('starting job number $i ');
  await Future.delayed(Duration(seconds: 1));
  print(' doing the job $i 20 %');
  await Future.delayed(Duration(seconds: 1));
  print(' doing the job $i 40 %');
  await Future.delayed(Duration(seconds: 1));
  print(' doing the job $i 60 %');
  await Future.delayed(Duration(seconds: 1));
  print(' doing the job $i 80 %');
  await Future.delayed(Duration(seconds: 1));
  print(' doing the job $i 100 %');
  print('finished job number ================================== $i ');


}


//TODO: NEVER WRITE LOOPS WITH ASYNC