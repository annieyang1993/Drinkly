import React, { Component } from 'react';
import { useEffect, useState, useContext } from "react";

import { connect } from 'react-redux';
import { Route, Redirect, withRouter } from 'react-router-dom';
import AuthContext from '../../context/Context'


export function AuthRoute({ component: Component, path, loggedIn, exact }){
  const authContext = useContext(AuthContext);
  return(
  <Route exact path={path} exact={exact} render={(props) => (
    !authContext.session ? (
      <Component {...props} />
    ) : (
      <Redirect to="/homepage" />
    )
  )} />)
};

export function ProtectedRoute({ component: Component, path, loggedIn, exact }){
  const authContext = useContext(AuthContext);
  return(
  <Route path={path} exact={exact} render={(props) => (
     authContext.session ? (
      <Component {...props} />
    ) : (
      <Redirect to="/" />
    )
  )} />)
};

export function AuthHome({component: Component, path, loggedIn, exact}){
  const authContext = useContext(AuthContext);
  return(
  <Route exact path={path} exact={exact} render={(props) => (
    !authContext.session ? (
      <Component {...props} />
    ) : (
      <Redirect to="/homepage" />
    )
  )} />)
}
