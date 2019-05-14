<aboutPage>
  <div>
    <div class=" ppap1">
    <div class="container">
      <div class="row">
        <div class="col">
          <h1 class="display-4 font-weight-bold">Travelmate</h1>
        </div>
      </div>
      <div class="row">
          <div class="col">
            <h2 >A New Way to Find Your Travel Companion and Make Friends</h2>
          </div>
      </div>
      <div class="row">
          <div class="col">
            <button type="button" class="btn btn-outline-light font-weight-bold" name=""  onclick={profile}>New User? Create your own profile</button>
          </div>
          <div class="col">
            <button type="button" class="btn btn-outline-light font-weight-bold" name=""  onclick={discover} >Discover your Travelmate</button>
          </div>
      </div>
    </div>

  </div>



    <div class="container">
      <div class="row">
        <div class="col-3">
          <img src="images/join1.png"  alt=" join" width="100" height="100">
        </div>
        <div class="col-7">
           <h3> Join</h3>
           <h4> Sign up, create your profile and upload your photos, join one of the largest online travelmate communities.</h4>
        </div>
      </div>
      <div class="row wrapper">
        <div class="col-3">
          <img src="images/connect.jpg" alt=" connect" width="100" height="100">
        </div>
        <div class="col-7">
           <h3> Connect </h3>
           <h4>Explore our millions of members and connect with your ideal travel companion.</h4>
        </div>
      </div>
      <div class="row">
        <div class="col-3">
          <img src="images/travelicon.jpg" alt=" travel" width="100" height="100">
        </div>
        <div class="col-7">
           <h3> Travel </h3>
           <h4>Plan and enjoy your trip!</h4>
        </div>
      </div>

  </div>
    <div class="story">
    <div class="container">

      <div class="row">
        <div class="col">
          <h3 class="story1">Story</h3>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block " src="images/couple.jpg" alt="First slide" width="60%" height="60%">
      </div>
      <div class="carousel-item">
        <img class="d-block" src="images/Beach.jpg" alt="Second slide" width="60%" height="60%">
      </div>
      <div class="carousel-item">
        <img class="d-block " src="images/travelcouple1.jpg" alt="Third slide" width="60%" height="60%">
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
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
  </div>

  <script>
      profile(){
         setProfile="setProfile";
         observer.trigger("setProfile",setProfile)
      }

      discover(){
         journeyState="newJourneys";
         observer.trigger('journeyState',journeyState)
      }
  </script>
  <style>
    h1 {
     margin-top: 210px;
      color:white;
      margin-left: 35%;
      size: 20px;

    }
    h2 {
   margin-top: 40px;
      color:white;
      margin-left: 10%;
      size: 15px;
      font-family: Gill Sans, sans-serif;
    }
    h3{
font-family: Gill Sans, sans-serif;
     margin-top: 20px;
      size: 13px;

    }
    h4{
font-family: Gill Sans, sans-serif;
     margin-top: 12px;
      size: 7px;

    }
    .ppap1{
      background-image: url("images/ppap1.jpg");
        background-size: auto;

    }
    button{
      margin-top: 120px;
      margin-left: 25%;
      margin-bottom: 70px;

    }
img{
 margin-top:17px;
  margin-left:20%;
}

.story{

  margin-top: 15px;
    margin-bottom: 25px;
background-color:rgba(233,236,239,1);

}
.footage {
  margin-top: 20px;
color:white;
  background-color:rgba(33,37,41,0.5);
margin-left: -130px;

}

p{

    margin-left:50%;
}
.story1{
margin-left: 48%;
font-family: Gill Sans, sans-serif;

}
/* .wrapper{
width:100%;
margin:0 autto;

}
.left{
    width:250px;

}
.right{
    width:250px;

} */
  </style>
</aboutPage>
