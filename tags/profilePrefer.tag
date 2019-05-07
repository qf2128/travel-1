<profilePrefer>
    <select value="first" onchange={firstPreferSet}>
      <option value="gender">---</option>
      <option value="gender">gender</option>
      <option value="star sign">star sign</option>
      <option value="ages">ages</option>
      <option value="accomodation expense">accomodation expense</option>
      <option value="food expense">food expense</option>
      <option value="transportation">transportation</option>
      <option value="time schedule">time schedule</option>
      <option value="travel type">travel type</option>
    </select>

    <select value="second" onchange={secondPreferSet}>
        <option value="gender">---</option>
        <option value="gender">gender</option>
        <option value="star sign">star sign</option>
        <option value="ages">ages</option>
        <option value="accomodation expense">accomodation expense</option>
        <option value="food expense">food expense</option>
        <option value="transportation">transportation</option>
        <option value="time schedule">time schedule</option>
        <option value="travel type">travel type</option>
    </select>

    <select value="third" onchange={thirdPreferSet}>
        <option value="gender">---</option>
        <option value="gender">gender</option>
        <option value="star sign">star sign</option>
        <option value="ages">ages</option>
        <option value="accomodation expense">accomodation expense</option>
        <option value="food expense">food expense</option>
        <option value="transportation">transportation</option>
        <option value="time schedule">time schedule</option>
        <option value="travel type">travel type</option>
    </select>

    <button type="button" name="button" onclick={savePreference}>Finish</button>



<script>
travelPrefer=[]
// console.log('that',this.userEmail)
//  let usersRef = database.collection('users');
//
 firstPreferSet(){
this.firstPrefer=event.target.value
// console.log('this.firstPrefer',this.firstPrefer)
travelPrefer.push(this.firstPrefer)
//  usersRef.doc(this.userEmail).update(travelPrefer)
 }

 // this.on('update', () => {
 //     this.user = opts.user;
 //     console.log('this.pppp',this.user);
 // });

  secondPreferSet(){
      this.secondPrefer=event.target.value
      travelPrefer.push(this.secondPrefer)
  }
  thirdPreferSet(){
      this.thirdPrefer=event.target.value
      travelPrefer.push(this.thirdPrefer)
      console.log('preference',travelPrefer)
  }

  savePreference(){
      observer.trigger('travelPrefer',travelPrefer)

  }

</script>


</profilePrefer>
