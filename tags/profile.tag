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
          <div class="avatar"><img src="http://www.designshock.com/wp-content/uploads/2016/04/man-7-400.jpg" width="30%"/></div>
          <progress value="0" max="100" id="uploader">0%</progress>
          <div class="custom-file">
            <input type="file" value="upload" class="custom-file-input" id="portraitFile">
            <label class="custom-file-label" for="portraitFile">Choose file</label>

          </div>
          <div class="submit">
            <button type="button" class="btn btn-outline-secondary" onclick={submitProfile}>Submit</button>

      </div>

    </div>

<script>
var profile={};
var portraitURL="";

      var storageRef=firebase.storage().ref('photos/'+file.name);
// get elements
var uploader=document.getElementById('uploader');
var portraitFile = document.getElementById('portraitFile');
console.log('event',portraitFile);

 portraitFile.addEventListener('change',this.uploadFile);
  uploadFile (){
    console.log("event",portraitFile);
    //get portraitFile
     var file=event.target.files[0];
     var portraitURL=portraitFile.value
     //create a storage usersRef
 }

this.state="";
// get elements
var uploader=document.getElementById('uploader');
var portraitFile = document.getElementById('portraitFile');
// console.log('event',portraitFile);
//
// portraitFile.addEventListener('change',this.uploadFile);
//     uploadFile (){
//     console.log("event",portraitFile);
//     //get portraitFile
//     var file=event.target.files[0];
//     // var portraitURL=portraitFile.value
//
//     //create a storage usersRef
//     var storageRef=firebase.storage().ref('photos/'+file.name);
//

//     //upload files
//     var task=storageRef.put(file);
//
//     //upload progress bar
//     task.on('state_changed',
//          function progress(snapshot){
//              var percentage = (snapshot.bytesTransferred/snapshot.totalBytes)*100;
//              uploader.value=percentage;
//          },
//
//          function error(err){
//
//          },
//
//          function complete(){
//
//          }
//     )
//     }

submitProfile() {

    var userName=document.getElementById('username').value;
    var age=document.getElementById('age').value;
    var gender=document.getElementById('gender').value;
    var zodiac=document.getElementById('zodiac').value;
    var portraitURL=document.getElementById('portraitFile').value;


    profile={userName:userName,
             age:age,
             gender:gender,
             zodiac:zodiac,
             portrait:portraitURL}
    console.log('profile',profile)
    observer.trigger('profile',profile)

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
