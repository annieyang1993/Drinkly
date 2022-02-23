import React, { useContext, useState, useMemo, useEffect} from 'react';
import { Link } from 'react-router-dom';
import {GrSubtractCircle} from 'react-icons/gr'
import {AiOutlinePlusCircle, AiOutlineMinusCircle} from 'react-icons/ai'
import {FaMinus} from 'react-icons/fa'
import AuthContext from '../../../context/Context'


export default function Modal() {
    const authContext = useContext(AuthContext);


    const handleClick = () => {
        authContext.setDeleteModal(false);
        setError('');


    }

    

    

   

    function RenderModal(){
            // const [quantity, setQuantity] = useState(Number(authContext.cart[authContext.editElementKey]["quantity"]));
            const [item, setItem] = useState(authContext.cart[authContext.editElementKey]);
            const [adding, setAdding] = useState(false);
            const [error, setError] = useState('');

            const addToCart = async (item) => {
            var cartTemp = authContext.cart;
            delete cartTemp[authContext.editElementKey];
            authContext.setCart(cartTemp);
            await new Promise(resolve => setTimeout(resolve, 500));
            setAdding(false);
            // setQuantity(1);
            authContext.setDeleteModal(false);
    
    }


   
        useEffect(()=>{
        //setQuantity(5)
    }, [])
        return(
            <div className = "ModalBackground" onClick={()=>{
                handleClick()}}>
            <div id = "ModalView" className="ModalView" onClick={(e) => e.stopPropagation()}> 
                <img className="exitButton" onClick={()=>
                    {
                    handleClick()}} src="/x.png"/>
                <div className="ModalScrollView">
                    <div className="currentItemName">{authContext.cart[authContext.editElementKey]["item_name"]}</div>
                <div className="currentItemDescription">{authContext.cart[authContext.editElementKey]["item_description"]}</div>
                    <img className = "itemPicture" src={authContext.cart[authContext.editElementKey]["img"]===null?
                        `/FillerLogo.png` :
                    `/Partners/${authContext.cart[authContext.editElementKey]["img"]}.png`}/>
                
</div>
                <div style={{width: '100%', marginTop: '-20px', textAlign: 'center', fontWeight: 'bold'}} >Are you sure you want to delete this item?</div>

               <div className = "addToCartTag2"
               onClick={()=>addToCart(authContext.cart[authContext.editElementKey])}>{
                adding ? `Loading...` :
                `Delete Item`}</div>
               
               </div>
            </div>)
         }
        

        return (
            <div className="modal">
                {authContext.deleteModal ===true? <RenderModal/> : <div></div>}
                
        
            </div>
        );
}

