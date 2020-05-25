import React, { useState } from "react";
import Typography from "@material-ui/core/Typography";
import CardModel from "../shared/CardModel";
import Form from "./Form";

const PATH = "places";

function PlaceCard({ data }) {
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
    </CardModel>
  );
}

export default PlaceCard;
