import React from 'react';
import { Link } from 'react-router-dom';
import Cart from './cart.js';
import {AiOutlineSearch} from 'react-icons/ai'
// import ReactDOM from 'react-dom';
import {FaShoppingCart} from 'react-icons/fa'
import {GoLocation} from 'react-icons/go'
import {MdOutlineDescription} from 'react-icons/md'
import {BiSearch} from 'react-icons/bi'
import {FaWalking} from 'react-icons/fa'
import {GiFireDash} from 'react-icons/gi'
import {BsDot} from 'react-icons/bs'
import {AiFillStar, AiOutlineHeart, AiOutlineMenu} from 'react-icons/ai'
import {BsStarFill, BsStarHalf} from 'react-icons/bs'
import Geocode from "react-geocode";
import AuthContext from '../../../context/Context'
import Header from '../header/header'
// import Carousel from '../homepage/carousel.jsx'
import { useEffect, useState , useContext} from 'react';

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


function RestaurantPage() {
  const authContext = useContext(AuthContext);
    const [address, setAddress] = useState('');
    const [locationDrop, setLocationDrop] = useState(false);
    const [location, setLocation] = useState({});
    const [items, setItems] = useState(authContext.items);
    

    const rad = (x) => {
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

    const fetchItems = (restaurantId) => {
        return (
            $.ajax({
            method: 'GET',
            url: `/api/restaurants/${restaurantId}/items`,
            })
        )
    }

    useEffect(async ()=>{
        var urlArray = window.location.href.split("/");
        var restaurantId = urlArray[urlArray.length - 1];
        var itemList = await fetchItems(restaurantId);
        authContext.setItems(itemList);
        console.log(itemList);
        //     this.props.menu(restaurantId);
        //  this.getLocation();
    }, [])

    // update(field) {
    //     return e => this.setState({
    //         [field]: e.currentTarget.value
    //     });
    // }

    const handleSubmit = (e) => {
        e.preventDefault();
            // const location = Object.assign({}, this.state.address);
            Geocode.fromAddress(address).then(
            (response) => {
                const { lat, lng } = response.results[0].geometry.location;
                //setting store location to lat long 
                window.location.href = "/#/homepage";
                authContext.setLocation({lat: lat, lng: lng})
                authContext.setAddress({category: address, latitude: lat, longitude: lng})

                // this.props.updateUserLocation(this.props.currentUser.id, {category: this.state.address, latitude: lat, longitude: lng});
                
            },

            (error) => {
                alert("Please type in valid address")
                // this.setState({locationBool: true})
            }
        );
            
        }

        const renderEvenBox = (count) => {
            if (count%2===0){
                return (<div></div>)
            } else{
                return (<li className="evenMenuItem" key={count+1}>

                    <div className="evenMenuItemLeft"></div>
                </li>)
            }
        }

        const handleClick = (id) => {
            console.log("CURRENT", authContext.currentRestaurant);
        
            authContext.getItem(authContext.currentRestaurant.id, id).then(()=>{
                authContext.setModal(true);
            });
            //console.log(id);
            //const {currentItem} = this.props;
        }

        const getLocation = async () =>{
        const location = await this.props.getLocation(this.props.currentUser["id"]);
        //this.setState({address: this.props.address["address_1"]+", "+this.props.address["city"]+", "+this.props.address["state"]})
            const lat = this.props.address.latitude;
            const lng = this.props.address.longitude;
            this.props.receiveLocation({lat: lat, lng: lng});
            this.setState({locationBool: true})
            this.setState({location: {lat: Number(lat), lng: Number(lng)}})
            // Geocode.fromLatLng(lat, lng).then(
            //   (response) => {
            //     const address = response.results[0].formatted_address;
            //     this.setState({address: address})
            //   })
            this.setState({address: this.props.address.category})
        }

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



        function RenderItemList(){
            console.log(items);
            var menuList = Object.values(authContext.items)
            var menuSections = []
            menuList.forEach((element)=>{
                if (!menuSections.includes(element["section"])){
                    menuSections.push(element["section"]);
                }   
            })
            return (
                    <ul className="menuItems">
                        {menuSections.map((element, i)=>{
                            var count = 0;
                            return(
                            <li className = "section" key={element}>
                                <br /><div className="sectionTitle">{element}</div>
                                <ul className = "sectionItems">
                                {menuList.map((element2, i) => {
                                    
                                    if (element2["section"]===element){
                                        count+=1;
                                        return(
                                        <li className="menuItem" key={element2["name"]} onClick={()=>handleClick(element2["id"])}>
                                            
                                            <div className="menuItemLeft">{element2["item_name"]}
                                            <div className="menuItemDescription">{element2["item_description"]}</div>
                                            </div>
                                            
                                            <img className="menuItemRight" src={element2["img"] ? `/Partners/${element2["img"]}.png` : 'FillerLogo.png'} />
                                        </li>)
                                    } else{
                                        return(<div></div>)
                                    }

                                })}
                                <div>
                                {/* {this.renderEvenBox(count)} */}
                                </div>
                                        
                                </ul> 
                                    <div className="break" />
                                    
                                    

                            </li> 
                            )
                                

                            

                        
                            })}

                
                    </ul>
                    




                    
            );
     }


        var distance = getDistance(authContext.location, {lat: authContext.currentRestaurant["latitude"], lng: authContext.currentRestaurant["longitude"]})
        var dollarSign = [];
        for (let i = 0; i<authContext.currentRestaurant["pricing"]; i++){
            dollarSign.push(<div className="dollar-sign">$</div>)
        }
        var starList = [];
        var starNum = Math.floor(Number(authContext.currentRestaurant["rating"]));
        for (let i = 0; i<starNum; i++){
            starList.push(<BsStarFill className="bs-star-rating" color={'rgb(227, 199, 14)'} size={20}/>)
        }
        if (Number(authContext.currentRestaurant["rating"])-starNum===0.5){
            starList.push(<BsStarHalf className="bs-star-rating" color={'rgb(227, 199, 14)'} size={20}/>)
        }

        //console.log(this.props.currentRestaurant);
        return (
            
            <div id="restaurant-container" className="restaurant-container" >
                <Header/>
                {/* <div className = "homePageHeader">

                <Link to="/"  className="header-button2" onClick={()=>{logout()}}><AiOutlineMenu color={'black'} size={20}/></Link>
                <div className="numberofItems">{Object.values(authContext.cart).length === 0 ? <div><FaShoppingCart className = "shoppingCart" color={'white'} size={15}/> 0</div> : <div><FaShoppingCart className = "shoppingCart" color={'white'} size={15}/> {Object.values(authContext.cart).length}</div>}</div>
                <form onSubmit={(e)=>handleSubmit(e)} className="location">
                    <div className="location-input">
                    <BiSearch className="magnifying-glass" size={20}/>
              
                    <div className="location-input-text">
                    <label>
                    <input type="text"
                      value={address}
                      onChange={(e)=>setAddress(e.target.value)}
                      className="location-input-text-inner"
                      placeholder="Enter Location"
                      onClick={()=>{
                          setLocationDrop(true);
                      }} 
                      />
     
                      </label>
                      </div>

                
                  </div>
                </form>
                <img className="logo-home" src="/Drinkly-logo-official.png" onClick={()=>{window.location.href = "/#/homepage"}}/>
                
                </div> */}

                <div className="restaurant-and-menu-container" onClick={()=>setLocationDrop(false)}>
                <div className = "restaurantInfoContainer">
                    <img src={authContext.currentRestaurant["img1"]} className = "restaurant-header-img"/>
                    <div className="restaurant-name">{authContext.currentRestaurant["name"]}</div>
                    <div className="restaurant-description">
                    <GiFireDash className= "flex-rating-word"/>
                    <div className="flex-star-bold">DrinklyPass</div>
                    <BsDot className="dot"/>
                    <div className="dot">{authContext.currentRestaurant["description"]}</div>
                    <BsDot className="dot"/>
                    <div className="dot">{authContext.currentRestaurant["rating"]}  </div>

                    <AiFillStar className= "dot2"/>
                     <div className="dot">  ({authContext.currentRestaurant["number_of_ratings"]} ratings)</div>
                    
                    {distance=== 'NaN' ? <div></div> : <div><BsDot className="dot"/>
                    <div className="dot">{(distance/60*5).toFixed(1)} km</div></div>}
                    
                    <BsDot className="dot"/>
                     <div className="dot">{dollarSign}</div>

                    </div>              

                
                    <div className="restaurant-address">
                    
               

                    { distance=== 'NaN' ? 
                    <div className="inner-box">
                        <div className="distance-container3">
                          <div className="mins">
                          {authContext.currentRestaurant["ready_in"]} min
                          </div>
                          <div className="walk">
                          ready for pickup
                          </div>

                      </div>
                    </div> : 
                    <div className="inner-box"> 
                      <div className="distance-container">
                          <div className="mins">
                          {distance} min
                          </div>
                          <div className="walk">
                          walk
                          </div>

                      </div>
                      <div className = "divider-line"></div>
                      <div className="distance-container2">
                          <div className="mins">
                          {authContext.currentRestaurant["ready_in"]} min
                          </div>
                          <div className="walk">
                          ready for pickup
                          </div>

                      </div>
                      </div>

                    }



                    

                    <div className = 'ratings-wrapper-bottom'>
                    <div className="star-list-container3">{authContext.currentRestaurant["number_of_ratings"]} ratings</div>
                    <div className="star-list-container">{starList}</div>
                    <div className="star-list-container2">{authContext.currentRestaurant["rating"]}</div>
                    </div>

                    <div className="save-container" 
                        style={authContext.saves.includes(Number(authContext.currentRestaurant["id"])) ? {background: 'rgba(33, 114, 120, 0.3)'} : {background: 'lightgray'}}>
                        <AiOutlineHeart 
                        
                        style={authContext.saves.includes(Number(authContext.currentRestaurant["id"])) ? {color: 'rgb(33, 114, 120)'} : {color: 'gray'}}
                        
                        
                     size={18} className="restaurant-heart"/>
                        <div className= "restaurant-save" onClick={()=>{
                        console.log("CLICKED")
                        handleSave(Number(Object.values(authContext.user)[0]['id']), Number(authContext.currentRestaurant["id"]))}}>{authContext.saves.includes(Number(authContext.currentRestaurant["id"])) ? 'Saved' : 'Save'}</div>
                        

                    </div>
                    

                    


                        {/* <GoLocation className= "flex-1"/>
                    
                    
                    <div className="flex-2">{this.props.currentRestaurant["address_1"]}, {this.props.currentRestaurant["city"]}, {this.props.currentRestaurant["state"]}</div>
                    {distance=== 'NaN' ? <div></div> : <div>
                    <FaWalking size={18} className="walking-man"/>
                    <div className="distance">{distance} mins</div> </div>} */}
                   
                    </div>

                    
                    <div className="restaurantMenu">
                        <RenderItemList/>
                     <div className="bottom-div">
                         <div>Prices on this menu are set directly by the Merchant. Prices may differ between Delivery and Pickup.</div>
                        <br/>
                        <GoLocation size={20} color={'black'}/>
                        <div>{authContext.currentRestaurant["address_1"]}, {authContext.currentRestaurant["city"]}, {authContext.currentRestaurant["state"]}</div>
                         </div>
                    </div>
                    
                </div>
                <div className = "restaurantMenuContainer">
                    <Cart/>
                    
                </div>
                </div>
            </div>
        );
}

export default RestaurantPage;
