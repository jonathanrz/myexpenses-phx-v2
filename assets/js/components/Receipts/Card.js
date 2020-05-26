import React, { useState } from "react";
import moment from "moment";
import Button from "@material-ui/core/Button";
import ButtonGroup from "@material-ui/core/ButtonGroup";
import Typography from "@material-ui/core/Typography";
import CardModel from "../shared/CardModel";
import Currency from "../../helpers/currency";
import getCSRFToken from "../../helpers/getCSRFToken";
import Form from "./Form";

const PATH = "receipts";

const csrfToken = getCSRFToken();

function ReceiptCard({ data, accounts }) {
  function confirmLink() {
    return `/${PATH}/${data.id}/${data.confirmed ? "unconfirm" : "confirm"}`;
  }

  const confirmButtonProps = {
    href: confirmLink(),
    "data-confirm": "Are you sure?",
    "data-method": "post",
    "data-to": confirmLink(),
    "data-csrf": csrfToken,
    rel: "nofollow",
  };

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
      <Typography
        variant="body1"
        color="textSecondary"
        component="p"
        gutterBottom
      >
        <b>Account:</b> {data.account.name}
      </Typography>
      <ButtonGroup
        size="small"
        color="primary"
        aria-label="small outlined button group"
      >
        <Button
          variant={data.confirmed ? "contained" : "outlined"}
          {...confirmButtonProps}
        >
          {data.confirmed ? "Confirmed" : "Confirm"}
        </Button>
        <Button
          variant={data.confirmed ? "outlined" : "contained"}
          {...confirmButtonProps}
        >
          {data.confirmed ? "Unconfirm" : "Unconfirmed"}
        </Button>
      </ButtonGroup>
    </CardModel>
  );
}

export default ReceiptCard;
