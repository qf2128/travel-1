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
var userMatchDestination=[]
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
    // filter destination
    destinationMatch=event.target.value
    let destinationRef=database.collection('destinations').doc(destinationMatch)
    destinationRef.onSnapshot(function(doc){
        var data=doc.data()
    userMatchDestination=data.userEmail
    console.log('userMatchDestination',userMatchDestination)
    that.update()

//get user progile
let userRef=database.collection('users').doc(that.userEmail)
   usersRef.collection('destination').doc(destinationMatch).onSnapshot(function(doc){
       that.userData=doc.data()
       console.log('tttt',that.userData)
       that.startTime=that.userData.startTime
       that.endTime=that.userData.endTime
       console.log('new',that.userMatchEmailNew)
   })



    for (var key in userMatchDestination){
        if (userMatchDestination[key]!=that.userEmail){
            userMatchEmail=userMatchDestination[key]
            console.log('MMMMM',userMatchEmail)
            that.userMatchEmailNew=userMatchEmail

        let usersMatchRef=database.collection('users').doc(userMatchDestination[key])
        usersMatchRef.collection('destination').doc(destinationMatch).onSnapshot(function(doc){
            console.log('dddd',userMatchDestination[key])
            var matchData=doc.data()
            var matchStartTime=matchData.startTime
            var matchEndTime=matchData.endTime

            console.log('new',matchStartTime,that.endTime)

            if (matchStartTime<=that.endTime&&matchEndTime>=that.startTime){
                console.log('userMatchEmail',userMatchDestination[key])
                timeMatchEmail.push(userMatchEmail)

            } else{
                console.log('false')
            }

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
