
const { test } = require('node:test');
const assert = require('node:assert');
const app = require('../src/app');

test('GET /add/2/3 returns 5', async () => {
  const server = app.listen(0);
  const { port } = server.address();

  try {
    const res = await fetch(`http://localhost:${port}/add/2/3`);
    const body = await res.json();
    assert.strictEqual(body.result, 5);
  } finally {
    server.close();
  }
});
