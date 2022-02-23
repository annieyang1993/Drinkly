import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
// import HomePageContainer from './../homepage/homepage_container';
import AuthContext from '../../../context/Context'
// import * as APIUtil from '../../util/session_api_util';
// import header from './../../../public/5452421.jpg';
// import FooterContainer from '../footer/footer';
import SimpleMap from './map.jsx'
// import SimpleMapLocation from './map-location.jsx'
// import RestaurantListView from './restaurant_list_view.jsx'
import {AiOutlineSearch} from 'react-icons/ai'
import {FaShoppingCart} from 'react-icons/fa'
import {GoLocation} from 'react-icons/go'
import {BiSearch} from 'react-icons/bi'
import Geocode from "react-geocode";
import GoogleMapReact from 'google-map-react';
import {BiCurrentLocation} from 'react-icons/bi'
import {FaWalking} from 'react-icons/fa'
import {BsDot} from 'react-icons/bs'
import {AiFillStar, AiOutlineHeart, AiOutlineMenu, AiOutlineClose} from 'react-icons/ai'
import {BiLogOutCircle} from 'react-icons/bi'
import Header from '../header/header'
// import {ImMenu} from 'react-icons/im'
// import { tupleTypeAnnotation } from '@babel/types';
// import Carousel from './carousel.jsx'
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

function HomePage(){
    const authContext = useContext(AuthContext);
    const [address, setAddress] = useState(authContext.address.category);
    const [locationBool, setLocationBool] = useState(false);
    const [location, setLocation] = useState(authContext.location[0]);
    const [restaurantListCount, setRestaurantListCount] = useState(0);
    const [restaurantList, setRestaurantList] = useState([]);
    const [tags, setTags] = useState([]);


    const updateUserLocation = (user_id, location) => {
    console.log("USER ID", user_id)
    return (
        $.ajax({
        method: 'PATCH',
        url: `/api/locations/${user_id}`,
        data: {location}
        })
    )
    }

    useEffect(()=>{
        setAddress(authContext.address.category);
        if (authContext.locationSearchBool === true){
          Geocode.fromAddress(authContext.locationSearch).then(
            (response) => {
              const { lat, lng } = response.results[0].geometry.location;
              //setting store location to lat long 
              authContext.setLocation({lat: lat, lng: lng});
              setLocation({lat: lat, lng: lng})
              authContext.setAddress({category: authContext.locationSearch, latitude: lat, longitude: lng})
              setAddress({category: authContext.locationSearch, latitude: lat, longitude: lng})
              updateUserLocation(authContext.user[authContext.session].id, {category: authContext.locationSearch, latitude: lat, longitude: lng});

              setLocationBool(true);
              setLocation({lat: lat, lng: lng});
              authContext.setLocationSearchBool(false);
              authContext.setLocationSearch('')
              // setState({locationBool: true})
              // this.setState({location: {lat: lat, lng: lng}})
              // this.renderMap();
              // this.renderRestaurantList();
            })
        }
        //getLocation();
        
    }, [])

    const save = (user_id, restaurant_id) => {
    return (
        $.ajax({
        method: 'POST',
        url: `/api/saves`,
        data: {user_id: Number(user_id), restaurant_id: Number(restaurant_id)}
        })
    )
    }

    const deleteSave = (user_id, restaurant_id) => {
    return (
        $.ajax({
        method: 'DELETE',
        url: `/api/saves/${user_id}`,
        data: {user_id: Number(user_id), restaurant_id: Number(restaurant_id)}
        })
    )
    }

    const handleSave = async (user_id, restaurant_id) => {
      if (authContext.saves.includes(Number(restaurant_id))){
        var deleteTemp = await deleteSave(user_id, restaurant_id);
        authContext.setSaves(Object.values(deleteTemp));
      } else{
        var addTemp = await save(user_id, restaurant_id);
        authContext.setSaves(Object.values(addTemp));
      }
    }
    
    

//     //   update(field) {
//     //     return e => setState({
//     //       [field]: e.currentTarget.value
//     //     });
//     //   }

    const rad = (x)=> {
        return x * Math.PI / 180;
    };

    const getDistance = (p1, p2) => {
        var R = 6378137; // Earth’s mean radius in meter
        var dLat = Number(rad(Number(p2.lat) - Number(p1.lat)));
        var dLong = Number(rad(Number(p2.lng) - Number(p1.lng)));
        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(Number(rad(p1.lat))) * Math.cos(Number(rad(p2.lat))) *
            Math.sin(dLong / 2) * Math.sin(dLong / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var d = R * c;
        return ((d/1000)/5*60).toFixed(0); // returns the distance in meter
    };

  const handleSubmit = (e, innerAddress) => {
    e.preventDefault();
    const location = Object.assign({}, address);
    Geocode.fromAddress(innerAddress).then(
      (response) => {
        const { lat, lng } = response.results[0].geometry.location;
        //setting store location to lat long 
        authContext.setLocation({lat: lat, lng: lng});
        setLocation({lat: lat, lng: lng})
        authContext.setAddress({category: innerAddress, latitude: lat, longitude: lng})
        setAddress({category: innerAddress, latitude: lat, longitude: lng})
        updateUserLocation(authContext.user[authContext.session].id, {category: innerAddress, latitude: lat, longitude: lng});

        setLocationBool(true);
        setLocation({lat: lat, lng: lng})
        // setState({locationBool: true})
        // this.setState({location: {lat: lat, lng: lng}})
        // this.renderMap();
        // this.renderRestaurantList();
      },

      (error) => {
        alert("Please type in valid address")
        setLocationBool(true);
      }
    );


    //
    }

    const getLocation = async () =>{
      console.log("PRINT 1")
      //this.setState({address: this.props.address["address_1"]+", "+this.props.address["city"]+", "+this.props.address["state"]})
      if (!(Object.keys(authContext.address).length===0)){
        console.log("PRINT 2")
        const lat = authContext.address.latitude;
        const lng = authContext.address.longitude;
        const address = authContext.address.category
        console.log("USER", authContext.user)
        // updateUserLocation(authContext.user.id, {category: address, latitude: lat, longitude: lng});
        
        setLocation({lat: lat, lng: lng});
        setLocationBool(true);
        setLocation({lat: Number(lat), lng: Number(lng)});
        setAddress(address);

      } else{
        console.log("PRINT 2")
        const location = await authContext.getLocation(authContext.user["id"]);
        const lat = authContext.address.latitude;
        const lng = authContext.address.longitude;
        setLocation({lat: lat, lng: lng});
        setLocationBool(true);
        setLocation({lat: Number(lat), lng: Number(lng)});
        setAddress(authContext.address.category);





       
      }
      
    }

//   const handleClick = (e) => {
//     e.preventDefault();
//   }

//   const getLocation = async () =>{
//       //this.setState({address: this.props.address["address_1"]+", "+this.props.address["city"]+", "+this.props.address["state"]})
//       if (!(Object.keys(this.props.address).length===0)){
//         const lat = this.props.address.latitude;
//         const lng = this.props.address.longitude;
//         const address = this.props.address.category
//         this.props.updateUserLocation(this.props.currentUser.id, {category: address, latitude: lat, longitude: lng});
        
//         this.props.receiveLocation({lat: lat, lng: lng});
//         this.setState({locationBool: true})
//         this.setState({location: {lat: Number(lat), lng: Number(lng)}})
//         this.setState({address: this.props.address.category})
//         this.renderMap();
//         this.renderRestaurantList();
//       } else{
//         const location = await this.props.getLocation(this.props.currentUser["id"]);
//         const lat = this.props.address.latitude;
//         const lng = this.props.address.longitude;
//         this.props.receiveLocation({lat: lat, lng: lng});
//         this.setState({locationBool: true})
//         this.setState({location: {lat: Number(lat), lng: Number(lng)}})
//         this.setState({address: this.props.address.category})
//         this.renderMap();
//         this.renderRestaurantList();
//         // Geocode.fromLatLng(lat, lng).then(
//         //   (response) => {
//         //     const address = response.results[0].formatted_address;
//         //     this.setState({address: address})
//         //   })
//         this.setState({address: this.props.address.category})
//       }
      
//   }

//   componentDidMount(){
    
//     this.getLocation();
//   }
  


  function RenderMap() {
    var restaurantCount = 0;
    var restaurantListShow = []
    var mapsRestaurantList = []
    var tag_address = authContext.address.category;
    
    authContext.restaurantList.map((element, i) => {
          var distance = getDistance(authContext.location, {lat: authContext.restaurantHash[element]["latitude"], lng: authContext.restaurantHash[element]["longitude"]})
          var dollarSign = [];
          for (let i = 0; i<authContext.restaurantHash[element]["pricing"]; i++){
            dollarSign.push(<div className="dollar-sign">$</div>)
          }
          var tags_exist = true;
          var has_all_tags = false;
          var restaurant_tags = [];
          Object.values(authContext.restaurantHash[element]["tags"]).map((ele2, j)=>(
            restaurant_tags.push(ele2["tag"])
          )) 
          console.log(restaurant_tags);

          if (tags===[]){
            tags_exist = false;
            has_all_tags = true;
          }

           else if (tags_exist===true){
            if (tags.every((ele2, j)=>(
              restaurant_tags.includes(ele2)
            ))){
              has_all_tags = true;
            }
          }
          if (distance < 120 & has_all_tags===true){
            restaurantCount+=1;
          restaurantListShow.push(
          
          authContext.restaurantHash[element]
          )}})
        return (
            // Important! Always set the container height explicitly
            <div style={{ height: '95vh', width: '100%', zIndex: 0}}>
              {console.log("IN RENDER MAP")}
              {console.log("LOC", authContext.location)}
                <GoogleMapReact
                    className="GoogleMapReact"
                    bootstrapURLKeys={{ key: "AIzaSyC8Vo2NBMXdPDU3hpOyQutB4bFi3x6ziMU" }}
                    center={authContext.location}
                    zoom={13}
                >  
                         <AnyReactComponent
                        
                        lat={authContext.location.lat}
                        lng={authContext.location.lng}
                        text={<div className="markerTag">
                        <FaWalking size={40} color='black'/>
                            </div>} />
                {console.log("HERE", authContext.location)}
                {restaurantListShow.map((element, i)=>{

                    return(
                    <AnyReactComponent
                        key={i}
                        lat={element["latitude"]}
                        lng={element["longitude"]}
                        text={<div className="markerTag"><div className="markerText">{element["name"]}</div>
                        <Link to={`/api/restaurants/${element["id"]}`}>
                            <img className="markers" src="/marker-blue.png"/></Link>
                            </div>} />
                   
                    )
                })}  

                           
                    
                    
                </GoogleMapReact>
            </div>
        );
    }

    function SearchBox(){
        const [innerAddress, setInnerAddress] = useState(authContext.address.category)

        return(
            <form onSubmit={(e)=>handleSubmit(e, innerAddress)} className="location">
                  <div className="location-input">
                    <BiSearch className="magnifying-glass" size={20}/>
              
                    <div className="location-input-text">
                    <input type="text"
                      value={innerAddress}
                      onChange={(e)=>{
                        setInnerAddress(e.target.value)}}
                      className="location-input-text-inner" 
                      placeholder="Enter Location"/>
                      </div>
                
                  </div>
                </form>
        )
    }

  function RenderRestaurantList(){
    
    var restaurantCount = 0;
    var restaurantListShow = []
    var mapsRestaurantList = []
    var tag_address = authContext.address;

    authContext.restaurantList.map((element, i) => {
          var distance = getDistance(authContext.location, {lat: authContext.restaurantHash[element]["latitude"], lng: authContext.restaurantHash[element]["longitude"]})
          var dollarSign = [];
          for (let i = 0; i<authContext.restaurantHash[element]["pricing"]; i++){
            dollarSign.push(<div className="dollar-sign">$</div>)
          }
          var tags_exist = true;
          var has_all_tags = false;
          var restaurant_tags = [];
          Object.values(authContext.restaurantHash[element]["tags"]).map((ele2, j)=>(
            restaurant_tags.push(ele2["tag"])
          )) 

          if (tags===[]){
            tags_exist = false;
            has_all_tags = true;
          }

           else if (tags_exist===true){
            if (tags.every((ele2, j)=>(
              restaurant_tags.includes(ele2)
            ))){
              has_all_tags = true;
            }
          }
          if (distance < 120 & has_all_tags===true){
            restaurantCount+=1;
          mapsRestaurantList.push(authContext.restaurantHash[element])
          restaurantListShow.push(
          
          <div>
            <li key={i} className="innerContainerList" >
            <Link className = "restaurantLinks" onClick={()=>{authContext.setCurrentRestaurant(authContext.restaurantHash[element])}} to={`/api/restaurants/${authContext.restaurantHash[element]["id"]}`}>
            <div className="images">
            <img className = "img1" src={authContext.restaurantHash[element]["img1"]}/>
            <img className="img2" src={authContext.restaurantHash[element]["img2"]} />
            </div>
              <div className="cafeName"> 
              {authContext.restaurantHash[element]["name"]}
              <AiOutlineHeart className="ready-in" color = {authContext.saves.includes(Number(element)) ? 'red' : 'gray'} onClick={()=>{handleSave(Object.values(authContext.user)[0]['id'], authContext.restaurantHash[element]['id'])}}/>
              </div>
             
            <div className="cafeDescription">{dollarSign}</div>
            <BsDot className="cafeDescription"/>
            <div className= "cafeDescription2">
            {authContext.restaurantHash[element]["description"]}
              </div>
            <div className="ready-in">Ready in {authContext.restaurantHash[element]["ready_in"]} min</div>
            <div className="cafeAddress">
                        {/* <GoLocation className= "flex-1"/> */}
                    <div className="flex-rating-word">{authContext.restaurantHash[element]["rating"]}</div>
                    <AiFillStar className= "flex-star"/>
                    <div className="flex-rating">{authContext.restaurantHash[element]["number_of_ratings"]} ratings</div>
                    <FaWalking size={15} className="walking-man"/>
                    <div className="distance">{distance} mins</div>
                    </div>
            
            </Link>
          </li>
            <div className="grayLine"></div>
          </div>
          )}})
    
    
    
    return (
      <div>
 

     
      <div className="restaurantContainerList"> 
      
      <div className="cafes-title">
        <div className="cafes-title-innerContainer">Cafes Near You</div>
      <div className="located-near">located near "{tag_address.category}"</div> </div>

      
      <div className="section-container">
                      
          

     
      <div className="coffee-container" >
            <div className="coffee-background">
            <img className = "coffee" onClick={()=>{
            var tagsTemp = tags.map((x)=>x);
            if (tagsTemp.includes("coffee")===false){
              tagsTemp.push("coffee");
            }
            setTags(tagsTemp);
              console.log("Clicked")
            }}
            src={'/coffee-icon-official.png'}/>
            </div>
            <div className="coffee-text">
              Coffee
            </div>
          </div>


      
        <div className="tea-container">
          <div className="cake-background">
          <img className = "tea" onClick={()=>{
            var tagsTemp = tags.map((x)=>x);
            if (tagsTemp.includes("tea")===false){
              tagsTemp.push("tea");
            }
            setTags(tagsTemp);
          }}
            src={'/tea-icon-official.png'}/>
          </div>
          <div className="tea-text">
          Tea
          </div>
        </div>

      
        <div className="bbt-container">
          <div className="bbt-background">
          <img className = "bbt" onClick={()=>{
            var tagsTemp = tags.map((x)=>x);
            if (tagsTemp.includes("bbt")===false){
              tagsTemp.push("bbt");
            }
            setTags(tagsTemp);
          }}
            src={'/bubble-tea-official-2.png'}/>
          </div>
          <div className="bbt-text">
          Boba
          </div>
        </div>


    
        <div className="cake-container">
          <div className="cake-background">
          <img className = "cake" onClick={()=>{
            var tagsTemp = tags.map((x)=>x);
            if (tagsTemp.includes("dessert")===false){
              tagsTemp.push("dessert");
            }
            setTags(tagsTemp);
          }}
            src={'/cake-icon-official.png'}/>
          </div>
          <div className="cake-text">
            
          Dessert
          </div>
        </div>

        <div className="alcohol-container">
          <div className="alcohol-background">
          <img className = "alcohol" onClick={()=>{
            var tagsTemp = tags.map((x)=>x);
            if (tagsTemp.includes("alcohol")===false){
              tagsTemp.push("alcohol");
            }
            setTags(tagsTemp);
          }}
            src={'/Alcoholic-icon-official.png'}/>
          </div>
          <div className="alcohol-text">
          Alcoholic
          </div>
        </div>

        </div>
        
      <div className="cafe-tags">
        <div className="tags">{tag_address.category}</div>
        {tags.map((ele, i)=>(
          <div className="tags"><AiOutlineClose size={10} className="close-tag" onClick={()=>{
            var tagsTemp = tags.map((x)=>x);
            delete tagsTemp[i];
            setTags(tagsTemp);
          }}/> {ele}</div>
        ))}
         
      </div>

      {restaurantListShow}
      
        
        

        
            {restaurantCount===0 ? <div className= "enter-location">We're sorry, there are no cafes in your area.
            <div className = "enter-location-inner">We currently have cafes located in New York and San Francisco.</div></div> : <div></div>}
      </div>
  
      </div>

    )

    //setRestaurantListCount(restaurantCount);

}

    return (
      <div className="homePageContainer">
        
          <div className="homepage-inner-container">
            

            <Header/>


            <div className="float-container">
            
                    
                    <div className="float-child-2">
          
                      

                      <div className="inner-float-child-1">
                        
                      <RenderRestaurantList/>
                      
                    </div>
                    </div>
                    <div className="float-child-1">
                        {/* <SimpleMap/> */}
                        {console.log(Object.values(authContext.location).length)}
                        {console.log(authContext.loaded)}
                      {!authContext.loaded || Object.values(authContext.location).length === 0 ? 
                      
                      <SimpleMap/> : <div><RenderMap/></div>}
                      </div>
                    

            </div>
       
          
          

          
          

          </div>
       
        
      </div>
    );
}



export default HomePage;
