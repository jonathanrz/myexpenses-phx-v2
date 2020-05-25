import React, { useState } from "react";
import moment from "moment";
import Typography from "@material-ui/core/Typography";
import CardModel from "../shared/CardModel";
import Currency from "../../helpers/currency";
import Form from "./Form";

const PATH = "bills";

function BillCard({ data }) {
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
        <b>Init Date:</b> {moment(data.init_date).format("DD/MM/YYYY")}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>End Date:</b> {moment(data.end_date).format("DD/MM/YYYY")}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>Value:</b> {Currency.format(data.value)}
      </Typography>
      <Typography variant="body1" color="textSecondary" component="p">
        <b>Due Day:</b> {data.due_day}
      </Typography>
    </CardModel>
  );
}

export default BillCard;
