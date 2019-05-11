<matchDesti>
    <label for="destination">which journey</label>
    <select value="destination" onchange={destinationForMatch}>
        <option value="">---</option>
        <option value={item} each={item,i in destination}>{item}</option>
    </select>
<p>mathc</p>
<script>
var that=this
this.userEmail=""
that.destination=[]
var destinationMatch=null
var usersRef=null
var userMatchDestination=[]
observer.on('userEmail',userEmail=>{
    this.userEmail=userEmail
    console.log('222',this.userEmail)

    usersRef = database.collection('users').doc(this.userEmail);
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

destinationForMatch(){
    destinationMatch=event.target.value
    let destinationRef=database.collection('destinations').doc(destinationMatch)
    destinationRef.onSnapshot(function(doc){
        var data=doc.data()
    userMatchDestination.push(data.userEmail)
    console.log('userMatchDestination',userMatchDestination)
    that.update()

    })
    observer.trigger('matchEmail',userMatchDestination)
    }

</script>

</matchDesti>
