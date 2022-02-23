import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
// import HomePageContainer from './../homepage/homepage_container';
import Geocode from "react-geocode";
import AuthContext from '../../../context/Context'
const AnyReactComponent = ({ text }) => <div>{text}</div>;

// set Google Maps Geocoding API for purposes of quota management. Its optional but recommended.
Geocode.setApiKey("AIzaSyB9fx4NpEW1D65AvgJjzY-npVoFUf17FRg");

// set response language. Defaults to english.
Geocode.setLanguage("en");

// set response region. Its optional.
// A Geocoding request with region=es (Spain) will return the Spanish city.
Geocode.setRegion("es");

// set location_type filter . Its optional.
// google geocoder returns more that one address for given lat/lng.
// In some case we need one address as response for which google itself provides a location_type filter.
// So we can easily parse the result for fetching address components
// ROOFTOP, RANGE_INTERPOLATED, GEOMETRIC_CENTER, APPROXIMATE are the accepted values.
// And according to the below google docs in description, ROOFTOP param returns the most accurate result.
Geocode.setLocationType("ROOFTOP");

// Enable or disable logs. Its optional.
Geocode.enableDebug();
//<td class="headerImg"><%=image_tag("/coffeeHeaderImg.png", width: '100%', height: '600', padding: '0', margin: '0-auto', 'object-fit': 'cover')%></td>

function GreetingPage(){
  const [address, setAddress] = useState('');
  const authContext = useContext(AuthContext);
  const [error, setError] = useState('');
  const [locationBool, setLocationBool] = useState(false);


  const handleSubmit = (e) => {
    e.preventDefault();
    authContext.setCurrentRestaurant({})
    // const location = Object.assign({}, this.state);
    // this.props.receiveLocation(location);
    
    Geocode.fromAddress(address).then(
      (response) => {
        const { lat, lng } = response.results[0].geometry.location;
        //setting store location to lat long 
        // this.props.receiveLocation({lat: lat, lng: lng});
        // this.props.searchAddress({category: address, latitude: lat, longitude: lng})
        window.location.href = "/#/login"
        authContext.setLocationSearch(address);
        authContext.setLocationSearchBool(true);
        setError("")
      },

      (error) => {
        setError("* Please type in a valid address")
        setLocationBool(true);
      }
    );
  }

  useEffect(async () => {
    // const data = await this.props.getAllRestaurants();
    // this.renderRecommended()
    
    }, [])


  function SessionLinks(){

      return(
     <nav className="login-signup">
       <img className="drinkly-logo-splash" src="Drinkly-logo-official-white.png"/>
       <div className = "signupBackground">
       <Link to="/signup" className = "signupContainer" onClick={()=>{authContext.setLocationSearch('');
        authContext.setLocationSearchBool(false);}}>Sign up</Link>
        </div>
        <div className = "signupBackground2">
       <Link to="/login" className = "signupContainer2" onClick={()=>{authContext.setLocationSearch('');
        authContext.setLocationSearchBool(false);}}>Sign In</Link>
        </div>
     </nav>)
    
  };

  function RenderRecommended(){
    const restaurants = ["Partners Coffee", "Bibble & Sip", "Abraco", "Home Coffee Roasters", "Neighbors Corner", "Rise & Grind Coffee and Tea"]
    var restaurantSquares = []
    return(<div>
    {authContext.restaurantList.map((element, i)=>{
    
      if (restaurants.includes(authContext.restaurantHash[element]["name"])){
        return(
          <Link onClick={()=>{authContext.setLocationSearch('');
        authContext.setLocationSearchBool(false); authContext.setCurrentRestaurant(authContext.restaurantHash[element])}}  className= "splash-links" to={`/api/restaurants/${authContext.restaurantHash[element]["id"]}`}>
          <div key={i} className="recommended-container">
            <img className="element-splash-img" src={`${authContext.restaurantHash[element]["img1"]}`}/>
            <div className="element-name">{authContext.restaurantHash[element]["name"]}</div>
            <div className="info-box">
            <div className = "info-below">Ready in {authContext.restaurantHash[element]["ready_in"]} min </div>
            <div className = "info-below2">{authContext.restaurantHash[element]["operating_time"]}</div>
            </div>
            {console.log(authContext.restaurantHash[element]["name"])}
          </div>
          </Link>
        )
        }
       })} </div>)
    
  }


    //if (this.props.currentUser)
    return (
      <div className="greetingContainer">
        <div className="splashHeader">
        <img  className = 'splash-img' src={'/HeaderImgClean5.png'}/>
      
        <div className = 'splash-header-info-wrapper'>
          
          <SessionLinks/>
          
        <div className = "welcome" top="50%" left="50%" color="white">Coffee shops and more, ready out the door</div>
        
        <br/>
        <div>
          <form onSubmit={(e)=>handleSubmit(e)} className="delivery-search-box">
            <label>
              <input type="text"
              value={address}
              onChange={(e)=>setAddress(e.target.value)}
              className="address-input"
              placeholder="Enter Location" />
            </label>
            <input className="address-submit" type="submit" value="Find"/>
          </form>
                    <div style={{width: '100%', textAlign: 'center', marginTop: '20px', color: 'white', opacity: '0.6'}}>{error}</div>
        </div>

       
        </div>


        <div>
        
        </div>
        </div>
        
         
         <div className="recommended-restaurants">
           
          <div className="recommended-cafes">Recommended Cafes</div>
          <RenderRecommended/>
          

        </div>



          <div className="footer-greeting">
            <div className = 'social-wrapper'>
              <a className="linkedin" href="https://www.linkedin.com/in/annie-yang-48780175/" target="_blank">
                 <img className="logo" src="/LinkedIn.png" /></a> 
            </div>

            <div className = 'social-wrapper'>
              <a className="github" href="https://github.com/annieyang1993?tab=repositories" target="_blank">
                                 <img className="logo" src="/Github.png" /></a> 
            </div>
        </div>

      </div>
    );
  
}



export default GreetingPage;

// const Greeting = ({ currentUser, logout }) => {
//   const sessionLinks = () => (
//     <nav className="login-signup">
//       <Link to="/login">Login</Link>
//       &nbsp;or&nbsp;
//       <Link to="/signup">Sign up!</Link>
//     </nav>
//   );

//   const signupLink = () => (
//     <Link to="/signup" >Sign up!</Link>
//   );

//   const loginLink = () => (
//     <Link to="/login">Login</Link>
//   );

//   const personalGreeting = () => (
//     <hgroup className="header-group">
//       <h2 className="header-name">Hi, {currentUser.username}!</h2>
//       <button className="header-button" onClick={logout}>Log Out</button>
//     </hgroup>
//   );
//   if (currentUser){
//     return personalGreeting();
//   } else if (window.location.href.split("#")[1]==="/"){
//     return sessionLinks();
//   } else{
//     return (<div></div>)
//   }

// };


// export default Greeting;
