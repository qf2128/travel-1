<app>
<navbar user={user}></navbar>


<button type="button" name=""  onclick={setProfile} if={user && profileState==="createProfile"} hide={profileState==="profileDone"||this.pageState==="LookProfile"||this.aboutState==="aboutUs"}>New user? create your profile</button>
<!-- <button type="button" name=""  onclick={setJourneys} if={profileState==="profileDone"} hide={this.journeyState==="newJourneys"||this.pageState==="LookProfile"||this.aboutState==="aboutUs"}>Start a new journey?</button> -->

<button type="button" name=""  onclick={startMatch} if={user && this.journeyState==="journeyDone"} hide={this.state||this.pageState==="LookProfile"||this.aboutState==="aboutUs"}>Start match?</button>

<!-- <button type="button" name=""  onclick={setTravelPrefer} if={user} hide={this.profileState==="setPreference"}>Set your travel preference</button> -->
<profile if={user && this.state==="setProfile"} hide={profileState==="profileDone"}></profile>
<script> console.log('uuuuuuu',this.user,this.state)</script>

<journeys if={user && this.journeyState==="newJourneys"} userEmail={this.user.email} hide={this.aboutState==="aboutState"||this.pageState==="LookProfile"||this.state==="startMatch"}></journeys>
<matchDesti if={user && this.state==="startMatch"} hide={this.aboutState==="aboutState"||this.pageState==="LookProfile"||this.journeyState==="newJourneys"} user={user} userEmail={userEmail}></matchDesti>
<!-- <profilePrefer user={user} show={this.state==="setPreference"}></profilePrefer> -->

<profilePage if={user && this.pageState==="LookProfile"} hide={this.journeyState==="newJourneys" || this.aboutState==="aboutState" || this.state==="setProfile"} user={user}> </profilePage>
<aboutPage if={this.aboutState==="aboutUs"|| !user}  hide={this.journeyState==="newJourneys" || this.pageState==="LookProfile" }> </aboutPage>


<score></score>

<div class="container">
    <div class="row">
        <div class="col">
            </div>
        </div>
    </div>


<script>
var that=this
this.user=null
this.userProfile = null
this.state=null
var userEmail=""
var userName=""
this.startTime=""
this.endTime=""
this.destination=""
that.profileState=""
this.profile=""
this.pageState=null
this.aboutState=null
var destinationRef=null
var preference=[]
var journeyRef=null
this.journeyState=""
this.pageState=null
this.aboutState="aboutUs";
this.age=""
var data=null;

let usersRef = database.collection('users');

   observer.on('journeyState',journeyState=>{
       if (data.userName){
       this.journeyState=journeyState;
       this.aboutState="";
       this.pageState="";
       this.state="";
       } else {
            alert("please fill your profile first")
       }

       that.update();
   })
   observer.on('setProfile',setProfile=>{
       if (userName){
           this.pageState="LookProfile"
           console.log('there123',this.state)
       } else {
          this.state=setProfile
          console.log('here',this.state)
      }
       that.update()
       this.journeyState="";
       this.aboutState="";

       that.update();
   })

   observer.on('aboutState',aboutState=>{
       this.aboutState=aboutState;
       this.journeyState="";
       this.pageState="";
       this.state="";
       that.update()
   })

  observer.on('journeyStateProfileDone',journeyState=>{
      this.journeyState=journeyState;
      this.aboutState="";
      this.pageState="";
      this.state="";
      that.update()
  })

   observer.on('pageStateSubmit',pageState=>{
       this.pageState=pageState,
       this.journeyState="";
       this.aboutState="";
       this.state=""
       var userName=data.userName
       that.update()
   })
   observer.on('age',age=>{
       this.age=age
   })
   observer.on('pageState',pageState=>{
       if (userName){
           this.pageState=pageState
       } else {
           this.state="setProfile"
      }
       this.journeyState="";
       this.aboutState="";
       that.update()
   })



   observer.on('startMatch',startMatch=>{
       if (data.userName){
           this.state=startMatch
           this.journeyState="";
           this.aboutState="";
           this.pageState="";
       } else {
           alert("please fill your profile and set journey first")
           // this.state="setProfile"
      }
       that.update();
       // if (this.user){
           userEmail=this.user.email;
           observer.trigger('userEmail',userEmail)
       // }

   })

   firebase.auth().onAuthStateChanged(userObj=> {
       console.log('userrrr',userObj)
   if (userObj) {
    // User is signed in.
       this.aboutState="aboutUs";
       this.user=userObj;
       that.update()
       userEmail=this.user.email;

       //observer.trigger('userEmail',userEmail)
       usersRef.doc(this.user.email).get().then(function(doc){
               data=doc.data()
           if (!doc.exists){
               console.log('no profile',data)
               that.profileState="createProfile";
               taht.update();
               usersRef.doc(userObj.email).set({
                    // userName:,
                    userEmail:userObj.email
               },{merge:true})
           }
           if (data.userName){
               userName=data.userName
               console.log("user has set profile")
               that.profileState="profileDone"
               console.log('have profile')
           } else{
               this.state="setProfile";
               that.update()
               console.log('dont have profile')
           }
           console.log('state',that.profileState)
           that.update()
    })
    journeyRef=usersRef.doc(this.user.email).collection('destination')
 //    usersRef.doc(this.user.email).get().then(function(doc){
 //        if (!doc.userAge){
 //            console.log('no profile')
 //        } else{
 //            this.profileState="profileDone"
 //        }
 // })
    matchRef= journeyRef.doc('matchData')
    }
   // profile_picture : imageUrl

 else {
    // No user is signed in.
       this.user = null;
       this.aboutState==="aboutUs";
       this.journeyState="";
       this.aboutState="";
       this.pageState="";
       this.state="";
       that.update()
   }


   });

   let stopListening;

    observer.on('userEntered',userProfile=>{
    })

    observer.on('aboutState',aboutState=>{
      this.aboutState=aboutState;
      console.log('aboutState',this.aboutState)
      that.update()
    })
setJourneys(){
    this.journeyState="newJourneys"
    console.log('22',this.state)
}

setProfile(){
    this.state="setProfile"
    console.log('profile')
}

   observer.on('destination',destination=>{
       this.destination=destination,
       console.log('this',this.destination)
       })

observer.on('journey',journey=>{
    this.journeyState="journeyDone";
    that.update()
    destinationRef=database.collection('destinations').doc(journey.destination)
    destinationRef.set({
        userEmail:firebase.firestore.FieldValue.arrayUnion(this.user.email)
    }, {merge:true})

    journeyRef.doc(this.destination).set({
           destination:journey.destination,
           startTime:journey.startTime,
           endTime:journey.endTime,
           accommodation:journey.accommodation,
           transportation:journey.transportation,
           userEmail:journey.userEmail,
           preferredGender:journey.prefferedGender,
           preferredZodiac:journey.prefferedZodiac
       })

       console.log('journey',journey)
       var preference=[journey.firstPrefer,journey.secondPrefer,journey.thirdPrefer]
       console.log('pppp',preference)
       journeyRef.doc(this.destination).set({
        preferences:firebase.firestore.FieldValue.arrayUnion(preference[0],preference[1],preference[2])
    }, {merge:true})
})

   observer.on('profile',profile=>{
       console.log('this.profile',profile)
       this.profileState="profileDone";
       that.update()
       usersRef.doc(this.user.email).set({
            userName:profile.userName,
            userAge:profile.age,
            userGender:profile.gender,
            userZodiac:profile.zodiac,
            userPortrait:profile.portrait
       },
       {merge:true})

   })

   startMatch(){
       if (da)
       this.state="startMatch"
       that.update()
   }


</script>

</app>
