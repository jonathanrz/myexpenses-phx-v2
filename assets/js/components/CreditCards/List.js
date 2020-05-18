import React from "react";
import Grid from "@material-ui/core/Grid";

import Card from "./Card";
import Form from "./Form";

function CreditCardList({ data }) {
  return (
    <Grid container spacing={2}>
      {data.map((d) => (
        <Grid item key={d.id}>
          <Card data={d} />
        </Grid>
      ))}
      <Grid item>
        <Form />
      </Grid>
    </Grid>
  );
}

export default CreditCardList;
