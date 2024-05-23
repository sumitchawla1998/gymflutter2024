import 'package:cloud_firestore/cloud_firestore.dart';

class TrainerService{
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Future addtrainer(String name,String email,String mobile,int salary,String address,String joindate)async{
        try{
            await firestore.collection("trainers").add({"name":name,"email":email,"mobile":mobile,"salary":salary,"address":address,"joindate":joindate});
        }catch(e){
            print(e);
        }

    }
    Future deleteTrainer(String? id)async{
        try{
            await firestore.collection("trainers").doc(id).delete();
        }catch(e){
            print(e);
        }
    }
    Future Updatetrainer (String id,String name, String email,String mobile,
    int salary, String address,String joindate, ) async{
        try{
            await firestore.collection('trainers').doc(id).update({
                'name':name,
                'email':email,
                'joindate':joindate,
                'salary':salary,
                'address':address,
                'mobile':mobile,

            });
        }catch(e){
            print(e);
        }
        }
}