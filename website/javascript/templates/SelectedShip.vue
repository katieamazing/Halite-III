<template>
<div class="map-props">
  <div class="map-props-list">
    <table>
      <tr>
        <th colspan="2">Selected Ship</th>
      </tr>
      <tr>
        <td>Owner:</td>
        <td :class="`color-${selectedShip.owner + 1}`">{{info.owner}}</td>
      </tr>
      <tr>
        <td>Ship ID:</td>
        <td>{{info.id}}</td>
      </tr>
      <tr>
        <td>Cargo:</td>
        <td>{{info.energy}} halite</td>
      </tr>
    </table>
  </div>
</div>
</template>
<script>
  import Vue from 'vue'
import {isUndefined, isNull} from 'lodash'

export default {
    props: ['selectedShip', 'players'],
    computed: {
      info: function () {
        const base = this.selectedShip
        let owner = `Player ${base.owner}`;
        if (!isUndefined(base.owner) && !isNull(base.owner) && this.players[base.owner]) {
          owner = this.players[base.owner].name;
        }

        return {
          location: `${base.x}, ${base.y}`,
          owner: owner,
          id: base.id,
          energy: base.energy,
        }
      }
    }
  }
</script>

<style scoped>
  th {
    padding: 5px 0;
  }
</style>
