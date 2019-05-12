<matchDesti>
    <score timeMatchEmail={timeMatchEmail}></score>
    <label for="destination" if={user}>which journey</label>
    <select value="destination" onchange={startMatch}>
        <option value="">---</option>
        <option value={item} each={item,i in destination}>{item}</option>
    </select>
    <span>{ timeMatchEmail } here </span>

<script>
var that=this;
that.userEmail=null;
that.destination=[];
that.userData=null;
var userGender="";
var userZodiac="";
var userAccommodation=""
var userPreferredGender=""
var userPreferredZodiac=""
that.userProfileData=null;
that.startTime=null;
that.endTime=null;
that.destinationMatch=null;
var userMatchAccommodation="";
var usersRef=null;
var userMatchDestination="";
var userMatchTransportation="";
var matchGender="";
var matchZodiac="";
// var genderScore=0;
// var zodiacScore=0;
// var transportaionScore=0;
var preference=[];
this.timeMatchEmail=[];
var userMatchEmail=null;
that.userMatchEmailNew=null;
that.matchProfileData=null;
observer.on('userEmail',userEmail=>{
    that.userEmail=userEmail;
    console.log('33333',that.userEmail);

    usersRef = database.collection('users').doc(that.userEmail);
    usersRef.collection("destination").get().then(function(querySnapshot){
    querySnapshot.forEach(function(doc){
    that.destination.push(doc.id)
    that.update()

    })
    })
    .catch(function(error) {
          console.log("Error getting documents: ", error);
      })
})


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

    that.destinationMatch=event.target.value

// get user  Profile

       usersRef.get().then(function(doc){
           that.userProfileData=doc.data();
           userGender=that.userProfileData.userGender;
           userZodiac=that.userProfileData.userZodiac;
       })
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
           debugger;
           preference=that.userData.preferences
           observer.trigger('preferenceshahahah',preference)
       })


     // filter destination
    let destinationRef=database.collection('destinations').doc(that.destinationMatch)
    destinationRef.get().then(function(doc){
        var data=doc.data()
    userMatchDestination=data.userEmail
    that.update()


    for (var key in userMatchDestination){
        var score=0;
        let usersMatchRef=database.collection('users').doc(userMatchDestination[key])

        usersMatchRef.collection('destination').doc(destinationMatch).onSnapshot(function(doc){
            userMatchEmail=userMatchDestination[key]
            console.log('MMMMM',userMatchEmail)
            var matchData=doc.data()
            var matchEndTime=matchData.endTime
            var matchStartTime=matchData.startTime
             console.log('matchEndTime',matchData.endTime)
            that.userMatchEmailNew=matchData.userEmail
            console.log('12',doc.data())
            if (matchStartTime<=that.endTime&&matchEndTime>=that.startTime){
                timeMatchEmail.push(matchData.userEmail)

            } else{
                console.log('false')

        debugger;
        let timeMatchRef=usersRef.collection('destination').doc(that.destinationMatch).collection('timeMatchEmail')
        if (userMatchDestination[key]!=that.userEmail){
            usersMatchRef.get().then(function(doc){
                that.matchProfileData=doc.data();
                 matchGender=that.matchProfileData.userGender;
                 matchZodiac=that.matchProfileData.userZodiac;
            })

            usersMatchRef.collection('destination').doc(that.destinationMatch).get().then(function(doc){
            userMatchEmail=userMatchDestination[key];
            var matchData=doc.data();
            userMatchAccommodation=matchData.accommodation;
            userMatchTransportation=matchData.transportation;
            let matchEndTime=matchData.endTime;
            let matchStartTime=matchData.startTime;
            that.userMatchEmailNew = matchData.userEmail
            if (matchStartTime <= that.endTime && matchEndTime >= that.startTime) {
                that.timeMatchEmail.push(that.userMatchEmailNew)
                console.log('heretimeMatchEmail',that.timeMatchEmail)

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
                  console.log('score',genderScore)
                  timeMatchRef.doc(that.userMatchEmailNew).set({
                     genderScore:genderScore,
                  },{merge:true})

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
                    console.log('score',zodiacScore)
                    timeMatchRef.doc(that.userMatchEmailNew).set({
                       zodiacScore:zodiacScore,
                   },{merge:true})

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
                     console.log('score',transportaionScore)
                     timeMatchRef.doc(that.userMatchEmailNew).set({
                        transportaionScore:transportaionScore,
                    },{merge:true})

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
                      console.log('score',accommodationScore)
                      timeMatchRef.doc(that.userMatchEmailNew).set({
                         accommodationScore:accommodationScore,
                     },{merge:true})

                }


            //  upload timeMatchEmail

                var timeMatchEmailAll=that.timeMatchEmail;
                observer.trigger('timeMatchEmailAll',timeMatchEmailAll)
            that.update();
             })
             // }
         }
            // console.log('timeMatchEmail',that.timeMatchEmail)

            }

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
