import React from "react";

import Button from "@material-ui/core/Button";
import Grid from "@material-ui/core/Grid";
import AddIcon from "@material-ui/icons/Add";
import Link from "@material-ui/core/Link";

import Card from "./Card";
import Form from "./Form";

const PATH = "accounts";

function AccountList({ data }) {
  return (
    <Grid container spacing={2}>
      {data.map((account) => (
        <Grid item key={account.id}>
          <Card data={account} />
        </Grid>
      ))}
      <Grid item>
        <Form />
      </Grid>
    </Grid>
  );
}

export default AccountList;
