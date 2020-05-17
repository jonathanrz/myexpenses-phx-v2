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
      <Grid item md={12}>
        <Grid container justify="flex-end">
          <Link href={`${PATH}/new`}>
            <Button
              variant="contained"
              color="secondary"
              startIcon={<AddIcon />}
            >
              New Account
            </Button>
          </Link>
        </Grid>
      </Grid>
      {data.map((account) => (
        <Grid item md={2} key={account.id}>
          <Card data={account} />
        </Grid>
      ))}
      <Grid item md={2}>
        <Form />
      </Grid>
    </Grid>
  );
}

export default AccountList;
