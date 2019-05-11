<navbar>
  <!-- HTML -->
<nav class="navbar navbar-light bg-light">
	<div class="buttonPosition">
<button   class="btn  my-2 my-sm-0" type="button" onclick={ Profile }>Profile</button>
<button  class="btn  my-2 my-sm-0" type="button" onclick={ About }>About</button>
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




  <script>
  let usersRef = database.collection('users');


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
