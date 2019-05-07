<app>

<navbar user={user}></navbar>
<button type="button" name=""  onclick={setTravelPrefer} if={user} hide={this.profileState==="setPreference"}>Set your travel preference</button>
<profilePrefer user={user} show={this.profileState==="setPreference"}></profilePrefer>

<div class="container">
    <div class="row">
        <div class="col">
            </div>
        </div>
    </div>
  <div class="title" show={!user}>
    Find Your TRAVEL BUDDY
  </div>
  <profile1 show={user}></profile1>


<script>
this.userProfile = null
this.profileState=null
this.userEmail=null

let usersRef = database.collection('users');
   firebase.auth().onAuthStateChanged(userObj=> {
       console.log('userrrr',userObj)
   if (userObj) {
    // User is signed in.
       this.user=userObj;
       this.userEmail=this.user.email;
       usersRef.doc(this.user.email).set({
            userName:this.user.displayName,
       })
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

setTravelPrefer(){
    this.profileState="setPreference";
    console.log('11',this.profileState)
    //
    // usersRef.doc(this.user.email).collection('profilePref').set({
    //
    //     firstPrefer:1,
    //     secondPrefer:2,
    //     thirdPrefer:3
    // })
}
observer.on('travelPrefer',travelPrefer=>{
    this.travelPrefer=travelPrefer;
  usersRef.doc(this.userEmail).update(travelPrefer)

    //      secondPrefer:this.travelPrefer[1],
    //      thirdPrefer:this.travelPrefer[2],
console.log('travelPrefer',travelPrefer)
     })


</script>

</app>
