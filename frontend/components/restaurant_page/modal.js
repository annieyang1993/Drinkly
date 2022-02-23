import React, { useContext, useState, useMemo, useEffect} from 'react';
import { Link } from 'react-router-dom';
import {GrSubtractCircle} from 'react-icons/gr'
import {AiOutlinePlusCircle, AiOutlineMinusCircle} from 'react-icons/ai'
import {FaMinus} from 'react-icons/fa'
import AuthContext from '../../../context/Context'


export default function Modal() {
    const authContext = useContext(AuthContext);
    const [quantity, setQuantity] = useState(1);
    const [item, setItem] = useState(authContext.item);
    const [adding, setAdding] = useState(false);
    const [error, setError] = useState('');


    // update(field) {
    //     return e => this.setState({
    //         [field]: e.currentTarget.value
    //     });
    // }

    const handleClick = () => {
        authContext.setModal(false);
        setError('');


    }

    const addToCart = async (item) => {
       console.log("CURRENT", authContext.currentRestaurant);
       
    if (authContext.session===null){
        authContext.setModal(false);
        window.location.href = '/#/login'
    } else{
     if (Object.values(authContext.cart).length===0){
         setAdding(true);
         var cartTemp = {}
         cartTemp[item.id] = item;
         cartTemp[item.id]['quantity'] = quantity;
         authContext.setCart(cartTemp);
         authContext.setCartRestaurant(authContext.currentRestaurant);
        setAdding(false);
        setQuantity(1);
        authContext.setModal(false);
     } else if ((Object.values(authContext.cart)[0]["restaurant_id"]===authContext.currentRestaurant.id)){
         var cartTemp = authContext.cart;
         if (cartTemp[item.id]===undefined){
             setAdding(true);
            cartTemp[item.id] = item;
            cartTemp[item.id]['quantity'] = quantity;
            authContext.setCart(cartTemp);
            await new Promise(resolve => setTimeout(resolve, 500));
            setAdding(false);
            setQuantity(1);
            authContext.setModal(false);
         } else{
             setAdding(true);
            cartTemp[item.id]['quantity'] = cartTemp[item.id]['quantity']+quantity;
            authContext.setCart(cartTemp);
            await new Promise(resolve => setTimeout(resolve, 500));
            setAdding(false);
            setQuantity(1);
            authContext.setModal(false);
         }
     } else{
         setError("Your cart currently has items from another restaurant. Please empty your cart first to add items.")
        //   console.log("cart Id", (Object.values(authContext.cart)[0]["item"]["restaurant_id"]));
        // console.log("restaurant id", authContext.restaurantId);
        //  authContext.addItemToCart({quantity: this.state.quantity, item: item});
     }
    }
    }

   

    function RenderModal(){

   
    
        return(
            <div className = "ModalBackground" onClick={()=>{
                setQuantity(1);
                handleClick()}}>
            <div id = "ModalView" className="ModalView" onClick={(e) => e.stopPropagation()}> 
                <img className="exitButton" onClick={()=>
                    {setQuantity(1); 
                    handleClick()}} src="/x.png"/>
                <div className="ModalScrollView">
                    <div className="currentItemName">{authContext.item["item_name"]}</div>
                <div className="currentItemDescription">{authContext.item["item_description"]}</div>
                    <img className = "itemPicture" src={authContext.item["img"]===null?
                        `/FillerLogo.png` :
                    `/Partners/${authContext.item["img"]}.png`}/>
                </div>

                <div className = "bottomSection">

                <div style={{width: '80%', padding: '2%', color: 'red', marginTop: '-25px', marginLeft: '9%', opacity: '0.6'}}>{error}</div>
                <div className = "quantityTag">
                    <div className = {quantity<=1 ? "plus-gray" : "plus"}
                    onClick={()=>{
                        if (quantity>1){
                            setQuantity(quantity-1);
                        }
                    }}> {quantity<=1 ? <AiOutlineMinusCircle color="gray"/> : <AiOutlineMinusCircle />}</div>
                    <div className = "quantity">{quantity}</div>
                    <div className = "minus" onClick={()=>{
                  
                            setQuantity(quantity+1);
                        
                    }}><AiOutlinePlusCircle/></div>

                </div>
               <div className = "addToCartTag"
               onClick={()=>addToCart(authContext.item)}>{
                adding ? `Loading...` :
                `Add to Cart - $${authContext.item["price"]}`}</div>
               </div>
            </div>
            </div>)
         }
        

        return (
            <div className="modal">
                {authContext.modal ===true? <RenderModal/> : <div></div>}
                
        
            </div>
        );
}

