<profilePage>
  <div>
     <div class="airBalloon">
         <div class="container">
            <div class="row">
                <div class="col">
                 <h1 class="display-4 font-weight-bold">Profile</h1>
                </div>
            </div>
            <div class="row">
               <div class="col-6">
                  <h2>Username: {userName}</h2>
                  <h2>Gender: {userGender}</h2>
                  <h2>Age: {userAge}</h2>
                  <h2>Zodiac Sign: {userZodiac}</h2>
               </div>
               <div class="col-6">
                  <div class="avatar"><img src={mediaURL} width=250px></div>
                     <progress value="0" max="100" id="uploader">0%</progress>
                  <div class="custom-file">
                     <input type="file" value="upload" class="custom-file-input" id="portraitFile" onchange={portraitFile}>
                     <label class="custom-file-label" for="portraitFile">Want to update your image?</label>
                                 <button type="button" name="button" onclick={ save } disabled={ !file }>save image</button>
                  </div>
               </div>
            </div>
               <div class="row">
                  <div class="col">
                    <button type="button" class="btn btn-outline-dark font-weight-bold" name=""  onclick={ setJourneys }  >Start A New Journey</button>
                  </div>
               </div>

    </div>
      </div>
    <div class="footage">
    <div class="container">
          <div class="row">
              <div class="col">
                  <p>  @ 2019 Travelmate</p>
              </div>
          </div>
    </div>
    </div>

  </div>

    <!-- <journeys if={user} userEmail={userEmail}></journeys> -->


<script>
var that=this;
this.mediaUEL;
 // let usersRef = database.collection('users').;
 this.user=this.opts.user;
 this.userEmail=this.user.email;

 let usersImageRef = database.collection('portrait');
 let usersRef=database.collection('users')

// get user Profile from firebase
 usersRef.doc(this.userEmail).get().then(function(doc){
     var data=doc.data()
     this.userName=data.userName;
     this.userAge=data.userAge;
     this.userZodiac=data.userZodiac;
     this.userGender=data.userGender;
 })

 //  get images
 usersImageRef.doc(this.userEmail).get().then(function(doc){
     var data=doc.data();
     this.mediaURL=data.mediaURL;
     console.log('this.mediaURL',this.mediaURL);
     that.update()
 })

//  change images
var profile={};
var portraitURL="";
this.state="";

let momentsRef = database.collection('portrait');
let storageRef = firebase.storage().ref();
let mediaStorageRef = storageRef.child('image');
this.file=null;

portraitFile(event){
    let fileInput=event.target;
    let files=fileInput.files;
    let file=files[0];
    let fileName=file.name;
    let fileSize= file.size;
    let fileType= file.type;
    this.file = file;
}

// save image to firebase  storage
save(){
    let uniqueName = this.file.name + "-" + Date.now();
    let fileRef = mediaStorageRef.child(uniqueName);

    fileRef.put(this.file).then(snapshot => {
    console.log('UPLOADED File');
    return snapshot.ref.getDownloadURL();
    }).then(downloadURL => {
    let key = momentsRef.doc(firebase.auth().currentUser.email).id;

    this.moment = {
    author: firebase.auth().currentUser.email,
    mediaURL: downloadURL,
    mediaType: this.file.type,
    id: key,
    createdAt: firebase.firestore.FieldValue.serverTimestamp()
    };
     this.mediaURL=this.moment.mediaURL;
     that.update()
    return momentsRef.doc(key).set(this.moment);
}).then( () => {
    console.log('SAVED to DATABASE');
    this.update();
     });;
    }

 setJourneys(){
  var journeyState="newJourneys"
  observer.trigger('journeyState',journeyState)
}



this.on('update', () => {
    that.user = opts.user;
    console.log('this.onnnn',this.user);
});



</script>

<style>
.airBalloon {

  background-image: url("images/ocean.jpg");

}
h1 {
 margin-top: 50px;
  margin-left: 45%;
  size: 20px;
  font-family: Gill Sans, sans-serif;
}
h2 {
margin-top: 40px;
  font-family: Gill Sans, sans-serif;

  size: 15px;
}
h3 {
size: 8px;
  font-family: Gill Sans, sans-serif;
}
img{
 margin-top: 50px;
 margin-left:70px;

}
button{
margin-top: 10px;
margin-bottom: 20px;
margin-left: 7px;
}
.question {
margin-top: 50px;
margin-bottom: 50px;

}
.footage {
  /* margin-top: 20px; */
/* color:white;
  background-color:rgba(33,37,41,0.5); */
margin-left: -130px;

}

p{

    margin-left:50%;
}
</style>
</profilePage>
