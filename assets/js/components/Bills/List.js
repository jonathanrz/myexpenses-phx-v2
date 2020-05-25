import React from "react";
import Grid from "@material-ui/core/Grid";

import Card from "./Card";
import Form from "./Form";

function BillList({ data }) {
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

export default BillList;
