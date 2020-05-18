import React, { useState } from "react";

import Typography from "@material-ui/core/Typography";

import Currency from "../../helpers/currency";
import getCSRFToken from "../../helpers/getCSRFToken";
import CardModel from "../shared/CardModel";

import Form from "./Form";

const PATH = "accounts";

function AccountCard({ data }) {
  return (
    <CardModel data={data} path={PATH} Form={Form}>
      <Typography
        variant="body1"
        color="textPrimary"
        component="p"
        gutterBottom
      >
        <b>Name:</b> {data.name}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>Balance:</b> {Currency.format(data.balance)}
      </Typography>
    </CardModel>
  );
}

export default AccountCard;
