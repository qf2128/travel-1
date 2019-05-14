<profile>
    <!-- HTML -->

    <div class="container-fluid">
      <div class="row">
        <div class="col">

            <label>Username:</label>
              <input type="text" class="form-control" id="username" placeholder="username">
          </div>
         </div>

            <label>Age:</label>
              <input type="text" class="form-control" id="age" placeholder="age">

        <label>Gender:</label>
        <select class="form-control" id="gender">
          <option>Male</option>
          <option>Female</option>
          <option>Gay</option>
          <option>Lesbian</option>
          <option>Bisexual</option>
          <option>Transgender</option>
        </select>

        <label>Zodiac:</label>
        <select class="form-control" id="zodiac">
          <option>Aquarius</option>
          <option>Pisces</option>
          <option>Aries</option>
          <option>Taurusn</option>
          <option>Gemini</option>
          <option>Cancer</option>
          <option>leo</option>
          <option>Virgo</option>
          <option>Libra</option>
          <option>Scorpio</option>
          <option>Sagittarius</option>
          <option>Capricorn</option>
        </select>
        </div>

        <div class="col">
          <div class="avatar">
              <img src="{ moment.mediaURL }" width="30%"/>
          </div>
          <progress value="0" max="100" id="uploader">0%</progress>
          <div class="custom-file">

            <input type="file" value="upload" class="custom-file-input" id="portraitFile">
            <label class="custom-file-label" id="fileButton" for="portraitFile">Choose file</label>


            <input type="file" ref="media" class="custom-file-input" id="portraitFile" onchange={portraitFile}>
            <label class="custom-file-label">choose your portrait image</label>
            <button type="button" name="button" onclick={ save } disabled={ !file }>save image</button>

          </div>
          <div class="submit">
            <button type="button" class="btn btn-outline-secondary" onclick={submitProfile} >Submit</button>
          </div>

    </div>

<script>
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

save(){
    let uniqueName = this.file.name + "-" + Date.now();
    let fileRef = mediaStorageRef.child(uniqueName);

    fileRef.put(this.file).then(snapshot => {
    console.log('UPLOADED File');
    return snapshot.ref.getDownloadURL();
    }).then(downloadURL => {
        console.log('-----1111',downloadURL)
    let key = momentsRef.doc(firebase.auth().currentUser.email).id;

    this.moment = {
    author: firebase.auth().currentUser.email,
    mediaURL: downloadURL,
    mediaType: this.file.type,
    id: key,
    createdAt: firebase.firestore.FieldValue.serverTimestamp()
    };
    console.log('moment',this.moment)
    return momentsRef.doc(key).set(this.moment);
}).then( () => {
    console.log('SAVED to DATABASE');
    this.reset();
    this.update();
     });;
    }


submitProfile() {

    var userName=document.getElementById('username').value;
    var age=document.getElementById('age').value;
    var gender=document.getElementById('gender').value;
    var zodiac=document.getElementById('zodiac').value;
    var portraitURL=document.getElementById('portraitFile').value;

    if(userName&&age&&gender&&zodiac&&portraitURL){
    profile={userName:userName,
             age:age,
             gender:gender,
             zodiac:zodiac,
             portrait:portraitURL}
    console.log('profile',profile)
    observer.trigger('profile',profile)
    var pageState="LookProfile"
    observer.trigger('pageState',pageState)
} else{
    alert("Please fill all the information")
}
  }








</script>

    <!-- CSS -->
    <style>

    .container-fluid{
      background-color: hsla(0,0%,100%,0.8);
      padding-top: 5em;
      padding-bottom: 5em;
      margin-top: 5em;
    }
    .input {
      border:0;
      font-family: 'Oxygen';
      letter-spacing: 0.5px;
      background: white;
      padding: 0 15px;
      font-size: 15px;
      outline: 0;
      display: block;
      width: 200px;
      height: 50px;
      line-height: 50px;
      line-height: 2;
      color: rgba(0,0,0,.6);
    }
    .input:focus {
      color: rgba(0,0,0,.9);
    }
    .submit{
      margin-top: 2em;
      margin-left: 20em;
    }

    </style>
</profile>
