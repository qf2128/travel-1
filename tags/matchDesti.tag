<matchDesti>
<div class="effiel">

  <div class="container">
    <div class="row">

      <div class="checkout">
        <h1>Check out your Travelmates</h1>
        <div class="line1">
          <label for="destination" if={user}>Choose the journey</label>
          <select value="destination" onchange={startMatch}>
            <option value="">---</option>
            <option value={item} each={item,i in destination}>{item}</option>
          </select>
          <br/>
          Below are your prospective travelmates recommended for you:
        </div>

        <div class="results">

          <div class="card">
		        <div class="card-header">{ username }</div>
		        <div class="card-body">

              <div class="container">
                <div class="row">
                  <div class="col-6">
                    <img if={ moment.mediaType.startsWith("image") } src="{ moment.mediaURL }">
                  </div>
                  <div class="col-6">
                   Gender: {matchProfileData.userGender}<br/>
                   Age: {matchProfileData.userAger}<br/>
                   Zodiac Sign: {matchProfileData.userZodiac}
                  </div>
                </div>
              </div>


		        </div>
		        <div class="card-footer">
			        Contact: { timeMatchEmail }
		        </div>
	        </div>

        </div>





      </div>



    </div>

  </div>


</div>



<style>

.effiel{
  background-image: url("images/effielTower.jpg");
}
.container {
font-family: Gill Sans, sans-serif;
margin-left: 20%;

}
.checkout{
margin-top: 50px;
margin-bottom: 50px;
}
.line1{
  font-size: 20px;
  margin-top: 50px;
  margin-bottom: 10px;
}

</style>



<script>
var that=this;
that.userEmail=null;
that.destination=[];
that.userData=null;
var userAccommodation=""
var userPreferredGender=""
var userPreferredZodiac=""
that.startTime=null;
that.endTime=null;
that.destinationMatch=null;
var userMatchAccommodation="";
var userMatchDestination="";
var userMatchTransportation="";
var matchGender="";
var matchZodiac="";
// var genderScore=0;
// var zodiacScore=0;
// var transportaionScore=0;
// var totalScore=0;
var preference=[];
this.timeMatchEmail=[];
var userMatchEmail=null;
that.userMatchEmailNew=null;
that.matchProfileData=null;

this.user=this.opts.user
that.userEmail=this.user.email

// observer.on('userEmail',userEmail=>{
    let usersRef = database.collection('users').doc(that.userEmail);
    usersRef.collection("destination").get().then(function(querySnapshot){
    querySnapshot.forEach(function(doc){
    that.destination.push(doc.id)
    that.update()

    })
    })
    .catch(function(error) {
          console.log("Error getting documents: ", error);
      })
// })


// create options in select
observer.on('destination',destination=>{
    var lengthDesti=that.destination.length
    var newDesti=null
        for (i=0;i<lengthDesti;i++){
            if(destination==that.destination[i]){
               return
            } else {
               newDesti=destination
            }
        }
        that.destination.push(newDesti)
    })



startMatch(){
      console.log('here')
      let usersRef = database.collection('users').doc(that.userEmail);
      that.destinationMatch=event.target.value

      //  get user profile
      usersRef.collection('destination').doc(that.destinationMatch).get().then(function(doc){
           that.userData=doc.data()
           var userJourneyData=that.userData;
           userAccommodation=that.userData.accommodation;
           userTransportation=that.userData.transportation;
           userPreferredGender=that.userData.preferredGender;
           userPreferredZodiac=that.userData.PreferredZodiac;
           observer.trigger('userJourneyData',userJourneyData)
           that.startTime=that.userData.startTime;
           that.endTime=that.userData.endTime;
           // debugger;
           preference=that.userData.preferences
           observer.trigger('preferenceshahahah',preference)
       })


     // get users with same destination
     let destinationRef=database.collection('destinations').doc(that.destinationMatch)
     destinationRef.get().then(function(doc){
          var data=doc.data()
          userMatchDestination=data.userEmail
          console.log('userMatchDestination',userMatchDestination)
          that.update()
     // })
     // search usersMatch profile by loop
        for (var key in userMatchDestination){
           let usersMatchRef=database.collection('users').doc(userMatchDestination[key])
         debugger;
           // get matchUsers' time, accommodation, transportation
           usersMatchRef.collection('destination').doc(that.destinationMatch).get().then(function(doc){
              userMatchEmail=userMatchDestination[key];
              var matchData=doc.data();
              userMatchAccommodation=matchData.accommodation;
              userMatchTransportation=matchData.transportation;
              let matchEndTime=matchData.endTime;
              let matchStartTime=matchData.startTime;
              that.userMatchEmailNew = matchData.userEmail

              // filter time
              if (matchStartTime <= that.endTime && matchEndTime >= that.startTime) {
                   that.timeMatchEmail.push(that.userMatchEmailNew)
                   console.log('heretimeMatchEmail',that.timeMatchEmail)
                   debugger;
               } else{
                   console.log('false')
               }
              // get users' profile: gender, zodiac
              let timeMatchRef=usersRef.collection('destination').doc(that.destinationMatch).collection('timeMatchEmail')
              if (userMatchDestination[key]!=that.userEmail){
                 usersMatchRef.get().then(function(doc){
                    that.matchProfileData=doc.data();
                    matchGender=that.matchProfileData.userGender;
                    matchZodiac=that.matchProfileData.userZodiac;
              })


                 //  score for gender
                 if (userPreferredGender == matchGender){
                     if (preference[0] == "gender"){
                        genderScore=30
                     } else if (preference[1] == "gender"){
                        genderScore=25
                     } else if (preference[2] == "gender"){
                         genderScore = 20
                     } else {
                        genderScore = 10
                     }
                 } else {
                     genderScore=0
                   }
                 timeMatchRef.doc(that.userMatchEmailNew).set({
                     genderScore:genderScore},{merge:true})

                  // score for zodiac

                 if (userPreferredZodiac == matchZodiac){
                     if (preference[0] == "zodiac"){
                      zodiacScore = 30
                     } else if (preference[1] == "zodiac"){
                      zodiacScore = 25
                     } else if (preference[2] == "zodiac"){
                      zodiacScore = 20
                     } else{
                      zodiacScore = 10
                     }
                 } else {
                     zodiacScore = 0
                   }
                 timeMatchRef.doc(that.userMatchEmailNew).set({
                     zodiacScore:zodiacScore},{merge:true})

                   // score for transportation

                 if (userTransportation == userMatchTransportation){
                     if (preference[0] == "transportation"){
                        transportaionScore = 30
                        } else if (preference[1] == "transportation"){
                        transportaionScore = 25
                        } else if (preference[2] == "transportation"){
                         transportaionScore = 20
                        } else {
                         transportaionScore = 10
                        }
                  } else {
                       transportaionScore = 0
                  }
                 timeMatchRef.doc(that.userMatchEmailNew).set({
                     transportaionScore:transportaionScore},{merge:true})

                // score for accommodation
                 if (userAccommodation == userMatchAccommodation){
                    if (preference[0] == "accommodation"){
                        accommodationScore = 30
                        } else if (preference[1] == "accommodation"){
                        accommodationScore = 25
                        } else if (preference[2] == "accommodation"){
                        accommodationScore = 20
                        } else {
                        accommodationScore = 10
                        }
                    } else {
                        accommodationScore = 0
                    }
                 timeMatchRef.doc(that.userMatchEmailNew).set({
                      accommodationScore:accommodationScore},{merge:true})
                  
                   that.update();
            }
         })
             // }
         }
            // console.log('timeMatchEmail',that.timeMatchEmail)
     })
     }


    // for (key in that.preference){

    // if (that.preference[key]="gender"){
    //   console.log("tttttrue")
    //   &&that.userData.prefferedGender==that.matchProfileData.gender
    //               console.log('matchGender',that.matchProfileData)





    this.on('update', () => {
        this.user = opts.user
    })



</script>

</matchDesti>
