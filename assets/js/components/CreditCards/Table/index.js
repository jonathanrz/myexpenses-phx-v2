import React from "react";
import { styled } from "@material-ui/core/styles";
import Box from "@material-ui/core/Box";
import Button from "@material-ui/core/Button";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";
import AddIcon from "@material-ui/icons/Add";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";
import Link from "@material-ui/core/Link";

import ThemeProvider from "../../shared/ThemeProvider";
import getCSRFToken from "../../../helpers/getCSRFToken";

const PATH = "credit_cards";

const csrfToken = getCSRFToken();

const AddButtonContainer = styled(Box)({
  display: "flex",
  "justify-content": "flex-end"
});

function CreditCardsTable({ data }) {
  return (
    <ThemeProvider>
      <AddButtonContainer mb={1}>
        <Link href={`${PATH}/new`}>
          <Button variant="contained" color="secondary" startIcon={<AddIcon />}>
            New Credit Card
          </Button>
        </Link>
      </AddButtonContainer>
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell>Account</TableCell>
              <TableCell />
            </TableRow>
          </TableHead>
          <TableBody>
            {data.map(d => (
              <TableRow key={d.id}>
                <TableCell component="th" scope="row">
                  <Link href={`${PATH}/${d.id}`}>{d.name}</Link>
                </TableCell>
                <TableCell component="th" scope="row">
                  <Link href={`accounts/${d.account.id}`}>
                    {d.account.name}
                  </Link>
                </TableCell>
                <TableCell align="right">
                  <Link href={`${PATH}/${d.id}/edit`}>
                    <EditIcon />
                  </Link>
                  <Link
                    href={`${PATH}/${d.id}`}
                    data-confirm="Are you sure?"
                    data-method="delete"
                    data-to={`/${PATH}/${d.id}`}
                    data-csrf={csrfToken}
                    rel="nofollow"
                  >
                    <DeleteIcon />
                  </Link>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </ThemeProvider>
  );
}

export default CreditCardsTable;
