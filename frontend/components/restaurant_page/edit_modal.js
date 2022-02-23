import React, { useContext, useState, useMemo, useEffect} from 'react';
import { Link } from 'react-router-dom';
import {GrSubtractCircle} from 'react-icons/gr'
import {AiOutlinePlusCircle, AiOutlineMinusCircle} from 'react-icons/ai'
import {FaMinus} from 'react-icons/fa'
import AuthContext from '../../../context/Context'


export default function Modal() {
    const authContext = useContext(AuthContext);


    const handleClick = () => {
        authContext.setEditModal(false);
        setError('');


    }

    

    

   

    function RenderModal(){
            const [quantity, setQuantity] = useState(Number(authContext.cart[authContext.editElementKey]["quantity"]));
            const [item, setItem] = useState(authContext.cart[authContext.editElementKey]);
            const [adding, setAdding] = useState(false);
            const [error, setError] = useState('');

            const addToCart = async (item) => {
            var cartTemp = authContext.cart;
            setAdding(true);
            cartTemp[item.id] = item;
            cartTemp[item.id]['quantity'] = quantity;
            authContext.setCart(cartTemp);
            await new Promise(resolve => setTimeout(resolve, 500));
            setAdding(false);
            setQuantity(1);
            authContext.setEditModal(false);
    
    }


   
        useEffect(()=>{
        //setQuantity(5)
    }, [])
        return(
            <div className = "ModalBackground" onClick={()=>{
                handleClick()}}>
            <div id = "ModalView" className="ModalView" onClick={(e) => e.stopPropagation()}> 
                <img className="exitButton" onClick={()=>
                    {setQuantity(1); 
                    handleClick()}} src="/x.png"/>
                <div className="ModalScrollView">
                    <div className="currentItemName">{authContext.cart[authContext.editElementKey]["item_name"]}</div>
                <div className="currentItemDescription">{authContext.cart[authContext.editElementKey]["item_description"]}</div>
                    <img className = "itemPicture" src={authContext.cart[authContext.editElementKey]["img"]===null?
                        `/FillerLogo.png` :
                    `/Partners/${authContext.cart[authContext.editElementKey]["img"]}.png`}/>
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
               onClick={()=>addToCart(authContext.cart[authContext.editElementKey])}>{
                adding ? `Loading...` :
                `Update Cart`}</div>
               </div>
            </div>
            </div>)
         }
        

        return (
            <div className="modal">
                {authContext.editModal ===true? <RenderModal/> : <div></div>}
                
        
            </div>
        );
}

