<navbar>
  <!-- HTML -->
<nav class="navbar navbar-light bg-light">
	<div class="buttonPosition">
<button class="btn  my-2 my-sm-0" type="button"  onclick={ setJourneys } if={user||this.journeyState==="journeyDone"}>New journey</button>
<button class="btn  my-2 my-sm-0" type="button"  onclick={ startMatch } if={user||this.journeyState==="journeyDone"}>Travel buddies</button>
<button class="btn  my-2 my-sm-0" type="button" onclick={ profile }>Profile</button>
<button  class="btn  my-2 my-sm-0" type="button" onclick={ about }>Home</button>
		</div>
	  <div id="navbarSupportedContent">
	    <ul class="  mr-auto">
	    </ul>
	    <div class="form-inline my-2 my-lg-0">
				<span if={ user } class="navbar-text mr-3">{ user.displayName }</span>
	      <button show={ !user } class="btn btn-outline-success my-2 my-sm-0" type="button" onclick={ login }>Login</button>
				<button show={ user } class="btn btn-outline-danger my-2 my-sm-0" type="button" onclick={ logout }>Logout</button>
	    </div>
    </div>
    <br>

    <!-- <journeys if={user} show={this.journeyState==="newJourneys"} userEmail={this.user.email}></journeys> -->



  <script>
  // this.state =null
	// this.user=null
	// var userEmail=""
  let usersRef = database.collection('users');
	// firebase.auth().onAuthStateChanged(userObj=> {
	// 		console.log('userrrr',userObj)
  var pageState=""


			//
			// Profile(){
			// 	   if (userObj) {
			// 	    // User is signed in.
			// 	       this.user=userObj;
			// 	       userEmail=this.user.email;
			// 	       observer.trigger('userEmail',userEmail)
			// 	       usersRef.doc(this.user.email).get().then(function(doc){
			// 	           var data=doc.data()
			//
			// 	           if (doc.exists){
			// 	               console.log('have profile',data)
			// 	               that.profileState="createProfile";
			//
			//
			// 	           console.log('state',that.profileState)
			// 	           that.update()
			// 	    })
			//
			//
	    // }


    profile(){
		 pageState="LookProfile";
		 observer.trigger('pageState',pageState)
	}

       about(){
		 aboutState="aboutUs";
		 observer.trigger('aboutState',aboutState)
	}

       setJourneys(){
         journeyState="newJourneys";
         observer.trigger('journeyState',journeyState)
    }

      startMatch(){
          startMatch="startMatch";
          observer.trigger('startMatch',startMatch)
      }
		login() {
			var provider = new firebase.auth.GoogleAuthProvider();
			firebase.auth().signInWithPopup(provider);
    }

		logout() {
			firebase.auth().signOut()
		}

        this.on('update', () => {
            this.user = opts.user;
            console.log('this.onnnn',this.user);
        });


  </script>

  <style>
    /* CSS */


	.buttonPosition {
    position:absolute;
		right: 16px;
	}

  </style>
</navbar>
