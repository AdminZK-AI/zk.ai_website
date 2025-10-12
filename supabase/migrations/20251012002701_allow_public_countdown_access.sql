/*
  # Allow Public Access to Countdowns

  1. Changes
    - Add policy to allow anonymous (public) users to read active countdowns
    - This enables the countdown banner to display for all website visitors
  
  2. Security
    - Only SELECT access is granted to public users
    - All other operations (INSERT, UPDATE, DELETE) remain restricted to authenticated users
*/

-- Drop the restrictive policies and create a public read policy
DROP POLICY IF EXISTS "Allow access for authenticated users" ON countdowns;

CREATE POLICY "Allow public read access to active countdowns"
  ON countdowns
  FOR SELECT
  TO anon
  USING (is_active = true);
