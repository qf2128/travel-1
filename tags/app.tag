<app>

<navbar user={user}></navbar>

<button type="button" name=""  onclick={setProfile} if={user} hide={this.state==="setProfile"}>New user? create your profile</button>
<button type="button" name=""  onclick={setJourneys} if={user} hide={this.state==="newJourneys"}>Start a new journey?</button>

<!-- <button type="button" name=""  onclick={setTravelPrefer} if={user} hide={this.profileState==="setPreference"}>Set your travel preference</button> -->
<profile if={use||this.state=="setProfile"} hide={this.state=="profileDone"}></profile>

<journeys if={user} show={this.state=="newJourneys"}></journeys>
<!-- <profilePrefer user={user} show={this.state==="setPreference"}></profilePrefer> -->

<div class="container">
    <div class="row">
        <div class="col">
            </div>
        </div>
    </div>
  <div class="title" show={!user}>
    Find Your TRAVEL BUDDY
  </div>


<script>
var tag=this
this.userProfile = null
this.state=null
this.userEmail=null
this.startTime=""
this.endTime=""
this.destination=""
this.profile=""
var preference=[]
var journeyRef=null
let usersRef = database.collection('users');

   firebase.auth().onAuthStateChanged(userObj=> {
       console.log('userrrr',userObj)
   if (userObj) {
    // User is signed in.
       this.user=userObj;
       this.userEmail=this.user.email;
       usersRef.doc(this.user.email).set({
            userName:this.user.displayName,
            userEmail:this.user.email
       })
    journeyRef=usersRef.doc(this.user.email).collection('destination')
    }
   // profile_picture : imageUrl

 else {
    // No user is signed in.
       this.user = null
   }
    this.update();

   });

   let stopListening;

    observer.on('userEntered',userProfile=>{
    })

setJourneys(){
    this.state="newJourneys"
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
    console.log('journey',journey)
    this.state="journeyDone";
    journeyRef.doc(this.destination).set({
           destination:journey.destination,
           startTime:journey.startTime,
           endTime:journey.endTime,
           accomodation:journey.accomodation
       })
       var preference=[journey.firstPrefer,journey.secondPrefer,journey.thirdPrefer]
       console.log('pppp',preference)
    journeyRef.doc(this.destination).set({
        preferences:firebase.firestore.FieldValue.arrayUnion(preference[0],preference[1],preference[2])
    }, {merge:true})
})

   observer.on('profile',profile=>{
       console.log('this.profile',profile)
       this.state="profileDone";
       usersRef.doc(this.user.email).set({
            userName:profile.userName,
            userAge:profile.age,
            userGender:profile.gender,
            zodiac:profile.zodiac,
            userPortrait:profile.portrait
       },
       {merge:true})

   })

</script>

</app>
