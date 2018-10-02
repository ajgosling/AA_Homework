import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);

  store = applyMiddlewares(store, addLoggingToDispatch);


  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = (store) => {
//   const OGDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     OGDispatch(action);
//     console.log(store.getState());
//   }
// }

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  store.dispatch(action);
  console.log(store.getState());
}


const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
}
// Now let's write an applyMiddlewares function that receives the store and the list of middlewares as arguments:
//
// Create a variable dispatch, setting it equal to store.dispatch
// forEach middleware in the list of middlewares,
// Reassign dispatch to the result of middleware(store)(dispatch)
// If the current middleware is addLoggingToDispatch, what is the result of addLoggingToDispatch(store)(dispatch)?
// What is next inside the logging function?
// Return Object.assign({}, store, { dispatch })
// To use this function, let's replace our reassignment of store.dispatch inside the DOMContentLoaded callback with:
//
// A reassignment of store to the result of calling applyMiddlewares
// We need to pass in the store and each middleware that we want to apply. In this case, addLoggingToDispatch is the only middleware.
// Test your code: If you interact with the app, your logging middleware should still send information about the state and actions to the console.
