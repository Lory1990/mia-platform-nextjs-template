# Production image, copy all the files and run next
FROM node:21-alpine
WORKDIR /app

LABEL name="sample-app" \
      description="" \
      eu.mia-platform.url="https://www.mia-platform.eu" \
      eu.mia-platform.version="${npm_package_version}"


ENV NODE_ENV production
ENV COMMIT_SHA "abcd123" 
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY public ./public

RUN mkdir -p /usr/static

RUN touch ./off \
  && chmod o+rw ./off \
  && echo "sample-app:$COMMIT_SHA" >> /usr/static/commit.sha


# Automatically leverage output traces to reduce image size
# https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --chown=nextjs:nodejs .next/standalone ./
COPY --chown=nextjs:nodejs .next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT 3000

CMD ["node", "server.js"]