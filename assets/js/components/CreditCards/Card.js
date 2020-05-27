import React, { useState } from "react";

import Typography from "@material-ui/core/Typography";

import CardModel from "../shared/CardModel";

import Form from "./Form";

const PATH = "credit_cards";

function CreditCardCard({ data, accounts }) {
  return (
    <CardModel data={data} path={PATH} Form={Form} formParams={{ accounts }}>
      <Typography
        variant="body1"
        color="textPrimary"
        component="p"
        gutterBottom
      >
        <b>Name:</b> {data.name}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>Account:</b> {data.account.name}
      </Typography>
    </CardModel>
  );
}

export default CreditCardCard;
