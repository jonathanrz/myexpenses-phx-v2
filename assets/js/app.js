import css from "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import M from "materialize-css";

document.addEventListener("DOMContentLoaded", function () {
  M.AutoInit();

  const elems = document.querySelectorAll(".datepicker");
  M.Datepicker.init(elems, {
    format: "yyyy-mm-dd",
  });
});

import "react-phoenix";
import Accounts from "./components/Accounts";
import Bills from "./components/Bills";
import Categories from "./components/Categories";
import CreditCards from "./components/CreditCards";
import Expenses from "./components/Expenses";
import Places from "./components/Places";
import Receipts from "./components/Receipts";
window.Components = {
  Accounts,
  Bills,
  Categories,
  CreditCards,
  Expenses,
  Places,
  Receipts,
};
