import React from "react";
import Grid from "@material-ui/core/Grid";

import Card from "./Card";
import Form from "./Form";

function BillList({ data, accounts }) {
  return (
    <Grid container spacing={2}>
      {data.map((account) => (
        <Grid item key={account.id}>
          <Card data={account} accounts={accounts} />
        </Grid>
      ))}
      <Grid item>
        <Form accounts={accounts} />
      </Grid>
    </Grid>
  );
}

export default BillList;
