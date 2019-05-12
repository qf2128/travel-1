<app>

<navbar user={user}></navbar>
<button type="button" name=""  onclick={setProfile} if={profileState==="createProfile"} hide={profileState==="profileDone"||this.pageState==="LookProfile"||this.aboutState==="aboutUs"}>New user? create your profile</button>
<button type="button" name=""  onclick={setJourneys} if={profileState==="profileDone"} hide={this.journeyState==="newJourneys"||this.pageState==="LookProfile"||this.aboutState==="aboutUs"}>Start a new journey?</button>
<button type="button" name=""  onclick={startMatch} if={user||this.journeyState==="journeyDone"} hide={this.state==="startMatch"||this.pageState==="LookProfile"||this.aboutState==="aboutUs"}>Start match?</button>
<!-- <button type="button" name=""  onclick={setTravelPrefer} if={user} hide={this.profileState==="setPreference"}>Set your travel preference</button> -->
<profile if={use||this.state==="setProfile"} hide={profileState==="profileDone"}></profile>

<journeys if={user} show={this.journeyState==="newJourneys"} userEmail={this.user.email}></journeys>
<matchDesti show={user&&this.state==="startMatch"} user={user} userEmail={userEmail}></matchDesti>
<!-- <profilePrefer user={user} show={this.state==="setPreference"}></profilePrefer> -->
<profilePage if={this.pageState==="LookProfile"}> </profilePage>
<aboutPage if={this.aboutState==="aboutUs"}> </aboutPage>

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
var that=this
this.user=null
this.userProfile = null
this.state=null
var userEmail=""
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
let usersRef = database.collection('users');

   firebase.auth().onAuthStateChanged(userObj=> {
       console.log('userrrr',userObj)

   if (userObj) {
    // User is signed in.
       this.user=userObj;
       userEmail=this.user.email;
       observer.trigger('userEmail',userEmail)
       usersRef.doc(this.user.email).get().then(function(doc){
           var data=doc.data()

           if (!doc.exists){
               console.log('no profile',data)
               that.profileState="createProfile";

               usersRef.doc(userObj.email).set({
                    userName:userObj.displayName,
                    userEmail:userObj.email
               })


           } else{
               that.profileState="profileDone"
               console.log('have profile',data)
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
       this.user = null
   }


   });

   let stopListening;

    observer.on('userEntered',userProfile=>{
    })


    observer.on('PageState',pageState=>{
      this.pageState=pageState;
      console.log('PageState',this.pageState)
      that.update()
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
           accomodation:journey.accomodation,
           transportation:journey.transportation,
           userEmail:journey.userEmail
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
       console.log('journey',journey)
       usersRef.doc(this.user.email).set({
            userName:profile.userName,
            userAge:profile.age,
            userGender:profile.gender,
            zodiac:profile.zodiac,
            userPortrait:profile.portrait
       },
       {merge:true})

   })

   startMatch(){
       this.state="startMatch"
       that.update()
   }

</script>

</app>
