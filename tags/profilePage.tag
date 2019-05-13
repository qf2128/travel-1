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
                  <h2>Username:</h2>
                  <h2>Gender:</h2>
                  <h2>Age:</h2>
                  <h2>Zodiac Sign:</h2>
               </div>
               <div class="col-6">
                  <div class="avatar"><img src="http://www.designshock.com/wp-content/uploads/2016/04/man-7-400.jpg" width="50%"/></div>
                     <progress value="0" max="100" id="uploader">0%</progress>
                  <div class="custom-file">
                     <input type="file" value="upload" class="custom-file-input" id="portraitFile">
                     <label class="custom-file-label" for="portraitFile">Choose file</label>
                  </div>
               </div>
            </div>
               <div class="row">
                  <div class="col">
                    <button type="button" class="btn btn-outline-light font-weight-bold" name=""  onclick={ setJourneys }  >Start A New Journey</button>
                  </div>
               </div>
        </div>
    </div>
  </div>

    <!-- <journeys if={user} userEmail={userEmail}></journeys> -->


<script>
var that=this
console.log('this----',this)
setJourneys(){
var journeyState="newJourneys"
 observer.trigger('journeyState',journeyState)
 // this.user=this.opts.user
 // this.userEmail=this.user.email
 // // debugger;
 // if (!this.user){
 //    alert("please fill your profile first")
 // }
 // console.log("uuuuuuu",that.user)
}

this.on('update', () => {
    that.user = opts.user;
    console.log('this.onnnn',this.user);
});

</script>

<style>
.airBalloon {

  background-image: url("images/airBalloon.jpg");
}
h1 {
 margin-top: 50px;
  margin-left: 45%;
  size: 20px;
}
h2 {
margin-top: 40px;

  size: 15px;
}
h3 {
size: 8px;

}
img{
 margin-top: 50px;
 margin-left:70px;

}
button{
margin-top: 10px;
margin-bottom: 10px;
margin-left: 7px;
}
.question {
margin-top: 50px;
margin-bottom: 50px;

}
</style>
</profilePage>
