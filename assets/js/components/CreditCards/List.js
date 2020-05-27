import React from "react";
import Grid from "@material-ui/core/Grid";
import keyBy from "lodash/keyBy";

import Card from "./Card";
import Form from "./Form";

function CreditCardList({ data, accounts }) {
  return (
    <Grid container spacing={2}>
      {data.map((d) => (
        <Grid item key={d.id}>
          <Card data={d} accounts={accounts} />
        </Grid>
      ))}
      <Grid item>
        <Form accounts={accounts} />
      </Grid>
    </Grid>
  );
}

export default CreditCardList;
