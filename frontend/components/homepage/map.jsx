import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
import GoogleMapReact from 'google-map-react';
import AuthContext from '../../../context/Context'


const AnyReactComponent = ({ text }) => <div>{text}</div>;

export default function SimpleMap(){
    const [center, setCenter] = useState({lat: 41.4216687, lng: -104.1715192 });
    const [zoom, setZoom] = useState(2);
    const authContext = useContext(AuthContext);

    return(

            // Important! Always set the container height explicitly
            <div style={{ height: '95vh', width: '100%', zIndex: 0}}>
                <GoogleMapReact
                    className="GoogleMapReact"
                    bootstrapURLKeys={{ key: "AIzaSyC8Vo2NBMXdPDU3hpOyQutB4bFi3x6ziMU" }}
                    defaultCenter={center}
                    defaultZoom={zoom}
                >  
                 
                {authContext.location === undefined ? <div></div> : authContext.restaurantList.map((element, i)=>{

                    return(
                    <AnyReactComponent
                    key={i}
                        lat={authContext.restaurantHash[element]["latitude"]}
                        lng={authContext.restaurantHash[element]["longitude"]}
                        text={<div className="markerTag"><div className="markerText">{authContext.restaurantHash[element]["name"]}</div>
                        <Link to={`/api/restaurants/${authContext.restaurantHash[element]["id"]}`}>
                            <img className="markers" src="/marker-blue.png"/></Link>
                            </div>} />
                   
                    )
        })} 
                    
                    
                </GoogleMapReact>
            </div>
        );
}


