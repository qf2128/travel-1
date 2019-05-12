<profilePage>
  <div>
    <div class="airBalloon">
    <div class="container">
      <div class="row">
        <div class="col">
          <h1 class="display-4 font-weight-bold">Profile</h1>
        </div>
      </div>
      <div class="row">
          <div class="col-6">
            <h2>Username:</h2>
            <h2>Gender:</h2>
            <h2>Age:</h2>
            <h2>Zodiac Sign:</h2>
          </div>
          <div class="col-6">
            <div class="avatar"><img src="http://www.designshock.com/wp-content/uploads/2016/04/man-7-400.jpg" width="50%"/></div>
            <progress value="0" max="100" id="uploader">0%</progress>
            <div class="custom-file">
              <input type="file" value="upload" class="custom-file-input" id="portraitFile">
              <label class="custom-file-label" for="portraitFile">Choose file</label>
          </div>
      </div>
    </div>

    <div class="question">
    <div class="row">
      <h3>If your travel buddy needs long time to apply makeup, waht will you do?</h3>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-dark" >Wait for her</button>
        <button type="button" class="btn btn-outline-dark" > Self-exploring until she is ready</button>
        <button type="button" class="btn btn-outline-dark" > Separate travel plans</button>
    </div>
    <div class="row">
      <h3>Do you like photography when travelling? If so, what kind of photography do you prefer?</h3>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-dark" >Portrait Photography</button>
        <button type="button" class="btn btn-outline-dark" > Landscape Photography</button>
        <button type="button" class="btn btn-outline-dark" > Separate travel plans</button>
    </div>
    <div class="row">
      <h3>When do you usually get up?</h3>
    </div>
    <div class="row">
      <button type="button" class="btn btn-outline-dark" >Before 8 a.m.</button>
      <button type="button" class="btn btn-outline-dark" > 8 - 10 a.m.</button>
      <button type="button" class="btn btn-outline-dark" > 10 a.m.-12 p.m.</button>
      <button type="button" class="btn btn-outline-dark" > After 12 p.m.</button>
    </div>
  </div>
      <div class="row">
          <div class="col">
            <button type="button" class="btn btn-outline-light font-weight-bold" name=""  onclick={Discover} }>Start A New Journey</button>
          </div>
      </div>
    </div>
  </div>
</div>

<style>
.airBalloon {

  background-image: url("images/airBalloon.jpg");
}
h1 {
 margin-top: 50px;
  margin-left: 45%;
  size: 20px;
}
h2 {
margin-top: 40px;

  size: 15px;
}
h3 {
size: 8px;

}
img{
 margin-top: 50px;
 margin-left:70px;

}
button{
margin-top: 10px;
margin-bottom: 10px;
margin-left: 7px;
}
.question {
margin-top: 50px;
margin-bottom: 50px;

}
</style>
</profilePage>
