import React, { useState } from "react";
import moment from "moment";
import Typography from "@material-ui/core/Typography";
import CardModel from "../shared/CardModel";
import Currency from "../../helpers/currency";
import Form from "./Form";

const PATH = "receipts";

function ReceiptCard({ data, accounts }) {
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
        <b>Date:</b> {moment(data.date).format("DD/MM/YYYY")}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>Value:</b> {Currency.format(data.value)}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>Account:</b> {data.account.name}
      </Typography>
    </CardModel>
  );
}

export default ReceiptCard;
