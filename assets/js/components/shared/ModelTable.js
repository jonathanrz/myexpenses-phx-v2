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

import ThemeProvider from "./ThemeProvider";
import getCSRFToken from "../../helpers/getCSRFToken";

const csrfToken = getCSRFToken();

const AddButtonContainer = styled(Box)({
  display: "flex",
  "justify-content": "flex-end"
});

function ModelTable({ data, path, label, renderHeaders, renderRowData }) {
  return (
    <ThemeProvider>
      <AddButtonContainer mb={1}>
        <Link href={`${path}/new`}>
          <Button variant="contained" color="secondary" startIcon={<AddIcon />}>
            New {label}
          </Button>
        </Link>
      </AddButtonContainer>
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              {renderHeaders()}
              <TableCell />
            </TableRow>
          </TableHead>
          <TableBody>
            {data.map(d => (
              <TableRow key={d.id}>
                {renderRowData(d)}
                <TableCell align="right">
                  <Link href={`${path}/${d.id}/edit`}>
                    <EditIcon />
                  </Link>
                  <Link
                    href={`${path}/${d.id}`}
                    data-confirm="Are you sure?"
                    data-method="delete"
                    data-to={`/${path}/${d.id}`}
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

export default ModelTable;
