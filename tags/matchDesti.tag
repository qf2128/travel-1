<matchDesti>
    <label for="destination" if={user}>which journey</label>
    <select value="destination" onchange={startMatch}>
        <option value="">---</option>
        <option value={item} each={item,i in destination}>{item}</option>
    </select>

<script>
var that=this
that.userEmail=null
that.destination=[]
that.userData=null
that.startTime=null
that.endTime=null
var destinationMatch=null
var usersRef=null
var userMatchDestination=null
var timeMatchEmail=[]
var userMatchEmail=null
that.userMatchEmailNew=null
observer.on('userEmail',userEmail=>{
    that.userEmail=userEmail
    console.log('33333',that.userEmail)

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
    destinationMatch=event.target.value
// get user  Profile
    let userRef=database.collection('users').doc(that.userEmail)
       usersRef.collection('destination').doc(destinationMatch).onSnapshot(function(doc){
           that.userData=doc.data()
           console.log('tttt',that.userData)
           that.startTime=that.userData.startTime
           that.endTime=that.userData.endTime
       })
     // filter destination
    let destinationRef=database.collection('destinations').doc(destinationMatch)
    destinationRef.onSnapshot(function(doc){
        var data=doc.data()
    userMatchDestination=data.userEmail
    console.log('userMatchDestination',userMatchDestination)
    that.update()


    for (var key in userMatchDestination){
        if (userMatchDestination[key]!=that.userEmail){
         console.log('111------',userMatchDestination[key])
        let usersMatchRef=database.collection('users').doc(userMatchDestination[key])
        usersMatchRef.collection('destination').doc(destinationMatch).onSnapshot(function(doc){
            userMatchEmail=userMatchDestination[key]
            console.log('MMMMM',userMatchEmail)
            var matchData=doc.data()
            var matchStartTime=doc.data().startTime
            var matchEndTime=matchData.endTime
            that.userMatchEmailNew=matchData.userEmail
            console.log('12',doc.data())
            if (matchStartTime<=that.endTime&&matchEndTime>=that.startTime){
                timeMatchEmail.push(matchData.userEmail)

            } else{
                console.log('false')
            }
             console.log('timeMatchEmail',timeMatchEmail)
        })



    }
}
})
}

    this.on('update', () => {
        this.user = opts.user
    })



</script>

</matchDesti>
