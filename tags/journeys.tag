<journeys>
<div class="luggage">
  <div class="container">
<br>
<br>
        <div class="row">
          <div class="col-8">
          <h1> Journey </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-6">
    <div class="text">

 <h3>1: Destination of your new Journey</h3>
    <select class="form-control" value="destination" onchange={submitDestination}>
        <option value="">---</option>
        <option value="Amsterdam">Amsterdam</option>
        <option value="Burlin">Burlin</option>
        <option value="Chicago">Chicago</option>
        <option value="Hawaii">Hawaii</option>
        <option value="London">London</option>
        <option value="Japan">Japan</option>
        <option value="Los Angeles">Los Angeles</option>
        <option value="Milano">Milano</option>
        <option value="New York">New York</option>
        <option value="Paris">Paris</option>
        <option value="Shanghai">Shanghai</option>
    </select>
</div>
</div>
</div>
<!-- time: from
    <select value="time" onchange={submitTime}>
        <option value="">---</option>
        <option value="1">January</option>
        <option value="2">February</option>
        <option value="3">March</option>
        <option value="4">April</option>
        <option value="5">May</option>
        <option value="6">June</option>
        <option value="7">July</option>
        <option value="8">August</option>
        <option value="9">September</option>
        <option value="10">October</option>
        <option value="11">November</option>
        <option value="12">December</option>
    </select>
    to
    <select value="time" onchange={submitTime}>
        <option value="">---</option>
        <option value="1">January</option>
        <option value="2">February</option>
        <option value="3">March</option>
        <option value="4">April</option>
        <option value="5">May</option>
        <option value="6">June</option>
        <option value="7">July</option>
        <option value="8">August</option>
        <option value="9">September</option>
        <option value="10">October</option>
        <option value="11">November</option>
        <option value="12">December</option>
    </select> -->
    <div class="row">
      <div class="col-6">
        <br>
    <form>
       <label for="start"><h3>2: Choose your planned journey time</h3></label><br>
       From <input class="form-control" type="month" id="start" name="start" min="2019-5.13" max="2020-5.13" onchange={submitStartTime}><br>
       To <input class="form-control" type="month" id="start" name="start" min="2019-5.13" max="2020-5.13" onchange={submitEndTime}>
    </form>
  </div>
</div>

    <div class="row">
      <div class="col-7">
<div class="preference">
  <br>
    <h3> 3: which are the three most important elements you would value in a journey? </h3><br>
</div>
</div>
</div>
    <div class="row">
      <div class="col-6">
    The First:
<select  class="form-control" value="first" onchange={firstPreferSet}>
  <option value="">---</option>
  <option value="gender"> travel buddy's gender</option>
  <option value="zodiac">travel buddy's zodiac</option>
  <option value="ages">travel buddy's ages</option>
  <option value="accommodationExpense">accommodation expense</option>
  <option value="transportation">transportation</option>
  <option value="travelType">travel type (casual/planned)</option>
</select>
   <br>The Second:
<select class="form-control" value="second" onchange={secondPreferSet}>
    <option value="">---</option>
    <option value="gender">travel buddy's gender</option>
    <option value="zodiac">travel buddy's zodiac</option>
    <option value="accommodationExpense">accommodation budget</option>
    <option value="transportation">transportation</option>
</select>
   <br>The Third:
<select  class="form-control" value="third" onchange={thirdPreferSet}>
    <option value="">---</option>
    <option value="gender">gender</option>
    <option value="zodiac">zodiac</option>
    <option value="ages">ages</option>
    <option value="accommodationExpense">accommodation expense</option>
    <option value="transportation">transportation</option>
    <option value="travelType">travel type (casual/planned)</option>
</select>
</div>
</div>


<div class="row">
  <div class="col">
<div>
    <br>
<h3> 4: Choose a star rating of accommodation </h3>
<button type="button" class="btn btn-outline-dark" id="button1"> * </button>
<button type="button" class="btn btn-outline-dark" id="button1"> ** </button>
<button type="button" class="btn btn-outline-dark" id="button1"> *** </button>
  <button type="button" class="btn btn-outline-dark" id="button1"> **** </button>
    <button type="button" class="btn btn-outline-dark" id="button1"> ***** </button>
</div>
</div>
</div>

<div class="row">
  <div class="col">
  <div>
      <br>
  <h3> 5: Choose your ideal transportation during travel </h3> <br>
  <button type="button" class="btn btn-outline-dark" id="button2"> Self-driving</button>
  <button type="button" class="btn btn-outline-dark" id="button2"> Public Transportation </button>
  <button type="button" class="btn btn-outline-dark" id="button2"> Uber/Taxi </button>
  </div>
</div>
</div>

<div class="row">
  <div class="col">
  <div>
      <br>
  <h3> 6: What's your preferred gender of your potential buddy?</h3> <br>
</div>
</div>
</div>

  <div class="row">
    <div class="col-3">
      <select class="form-control" id="gender" onchange={prefferedGender}>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Gay">Gay</option>
        <option value="Lesbian">Lesbian</option>
        <option value="Bisexual">Bisexual</option>
        <option value="Transgender">Transgender</option>
      </select>
  </div>
</div>


  <div class="row">
    <div class="col">
  <div class="">
      <br>
        <h3> 7: What's your preferred zodiac of your potential buddy? </h3>
  </div>
</div>
</div>

        <div class="row">
          <div class="col-3">
            <select class="form-control" id="zodiac" onchange={prefferedZodiac}>
              <option value="Aquarius">Aquarius</option>
              <option value="Pisces">Pisces</option>
              <option value="Aries">Aries</option>
              <option value="Taurusn">Taurusn</option>
              <option value="Gemini">Gemini</option>
              <option value="Cancer">Cancer</option>
              <option value="leo">leo</option>
              <option value="Virgo">Virgo</option>
              <option value="Libra">Libra</option>
              <option value="Scorpio">Scorpio</option>
              <option value="Sagittarius">Sagittarius</option>
              <option value="Capricorn">Capricorn</option>
            </select>
  </div>
 </div>
 <br>
 <div class="row">
   <div class="col-3">
 <button class="btn btn-dark" type="button" name="button" onclick={submitJourney}>Submit</button>
</div>
</div>
</div>
</div>
<div class="footage">
<div class="container">
      <div class="row">
          <div class="col">
              <p>  @ 2019 Travelmate</p>
          </div>
      </div>
</div>
</div>





    <script>
    var journey={};
    var destination="";
    var time="";
    var startTime="";
    var endTime="";
    var accommodation=""
    var firstPrefer=""
    var secondPrefer=""
    var thirdPrefer=""
    var transportation=""
    var prefferedGender=""
    var prefferedZodiac=""
        submitDestination(){
            destination=event.target.value
            observer.trigger('destination',destination)
            console.log(destination)
        }
        // submitTime(){
        //     time=event.target.value
        //     console.log(time)
        // }
         submitStartTime(){
             startTime=event.target.value
             //
             // console.log(startTime)
         }
         submitEndTime(){
             endTime=event.target.value
             //observer.trigger('endTime',endTime)
             // console.log(endTime)
         }
         firstPreferSet(){
           firstPrefer=event.target.value
           // console.log('firstPrefer',firstPrefer)
         }
         secondPreferSet(){
             secondPrefer=event.target.value
             // console.log('secondPrefer',secondPrefer)
         }
         thirdPreferSet(){
             thirdPrefer=event.target.value
             // console.log('thirdPrefer',thirdPrefer)
         }
         prefferedGender(){
            prefferedGender=event.target.value
         }
         prefferedZodiac(){
             prefferedZodiac=event.target.value
         }

          document.body.addEventListener("click", event => {
              if (event.target.id == "button1") {
                console.log("Clicked", event.target.textContent);
                accommodation=event.target.textContent
            } else if (event.target.id == "button2"){
                console.log("Clicked", event.target.textContent);
                transportation=event.target.textContent
                console.log('transportation',transportation)
            }
            });



          submitJourney(){
              console.log('2--------',opts)
              journey={destination:destination,
                       startTime:startTime,
                       endTime:endTime,
                       accommodation:accommodation,
                       firstPrefer:firstPrefer,
                       secondPrefer:secondPrefer,
                       thirdPrefer:thirdPrefer,
                       transportation:transportation,
                       userEmail:opts.useremail,
                       prefferedGender:prefferedGender,
                       prefferedZodiac:prefferedZodiac,

                   }
                if(journey.destination && journey.startTime && journey.endTime && journey.accommodation && journey.firstPrefer && journey.secondPrefer && journey.thirdPrefer && journey.transportation){
                    observer.trigger('journey',journey)
                    startMatch="startMatch";
                    observer.trigger('startMatch',startMatch)
                } else{
                    alert("please fill all the information")
                }

          }

    </script>
<style>
.luggage{
  background-image: url("images/blue.jpg");

}
.container {
font-family: Gill Sans, sans-serif;
margin-left: 20%;
}
.form-control{

  background-color:rgba(0,64,133,0.1);
}

.footage {
  /* margin-top: 20px; */
/* color:white; */
  /* background-color:rgba(33,37,41,0.5); */
margin-left: -130px;

}

p{

    margin-left:35%;
}



</style>
</journeys>
